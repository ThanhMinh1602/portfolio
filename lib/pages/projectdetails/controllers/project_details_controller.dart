import 'dart:convert';
import 'package:flutter/foundation.dart' show compute;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/utils/github_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectDetailsController extends GetxController {
  // Project data
  final project = Rx<ProjectModel?>(null);
  final isLoading = true.obs;

  // Video player state
  YoutubePlayerController? youtubeController;
  final isVideoInitialized = false.obs;
  final videoError = ''.obs;

  // GitHub repository browser state
  final folderStructure = <String, dynamic>{}.obs;
  final isLoadingFiles = true.obs;
  final selectedFileContent = ''.obs;
  final selectedFilePath = ''.obs;
  final isLoadingContent = false.obs;
  final errorMessage = ''.obs;
  final Map<String, String> _fileContentCache = {};
  final String? _githubToken = dotenv.env['KEY_GITHUB_API'];

  ProjectDetailsController({ProjectModel? projectModel}) {
    if (projectModel != null) {
      project.value = projectModel;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initializeProject();
  }

  void _initializeProject() {
    final Map<String, dynamic>? args = Get.arguments;
    if (args != null && args.containsKey('project')) {
      project.value = args['project'] as ProjectModel;
      isLoading.value = false;
      _initializeVideoIfAvailable();
      _fetchAllFiles();
    } else {
      _fetchProjectFromId();
    }
  }

  void _fetchProjectFromId() async {
    try {
      isLoading(true);
      final String? projectId = Get.parameters['id'];

      if (projectId != null) {
        project.value = ProjectModel(
          title: "Demo Project",
          description: "This is a demo project description",
          technologies: ["Flutter", "GetX", "Firebase"],
          features: ["Feature 1", "Feature 2", "Feature 3"],
          timeline: "2024",
          fontendLink: "https://github.com/demo/project",
        );
        _initializeVideoIfAvailable();
        _fetchAllFiles();
      }
    } finally {
      isLoading(false);
    }
  }

  void _initializeVideoIfAvailable() {
    final projectData = project.value;
    if (projectData == null) return;

    String? videoUrl = projectData.videoUrl;
    if (videoUrl == null || videoUrl.isEmpty) {
      videoError.value = 'No video available';
      return;
    }

    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId != null) {
      youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          showLiveFullscreenButton: false,
          enableCaption: true,
          captionLanguage: 'en',
        ),
      );
      isVideoInitialized.value = true;
    } else {
      videoError.value = 'Invalid YouTube URL';
      isVideoInitialized.value = false;
    }
  }

  @override
  void onClose() {
    youtubeController?.dispose();
    super.onClose();
  }

  Future<void> _fetchAllFiles({String? customLink}) async {
    final projectData = project.value;
    if (projectData == null) {
      print('ProjectData is null');
      return;
    }

    // Debug token
    if (_githubToken == null) {
      print('ERROR: GitHub token is null. Check your .env file');
      errorMessage.value =
          'GitHub token is missing. Please check configuration.';
      isLoadingFiles.value = false;
      return;
    }

    final linkToUse = customLink ?? projectData.fontendLink;
    final repoOwner = GitHubParser.getRepoOwner(linkToUse);
    final repoName = GitHubParser.getRepoName(linkToUse);
    final branch = projectData.branch ?? 'main';

    print('GitHub API Request Details:');
    print('- Repository Link: $linkToUse');
    print('- Owner: $repoOwner');
    print('- Repository Name: $repoName');
    print('- Branch: $branch');
    print('- Token Length: ${_githubToken?.length ?? 0}');

    if (repoOwner == null || repoName == null) {
      final error = 'Invalid repository URL format: $linkToUse';
      print('ERROR: $error');
      errorMessage.value = error;
      isLoadingFiles.value = false;
      return;
    }

    final url =
        'https://api.github.com/repos/$repoOwner/$repoName/git/trees/$branch?recursive=1';
    print('Making GitHub API request to: $url');

    try {
      final headers = {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_githubToken',
      };
      print('Request headers: $headers');

      final response = await http.get(Uri.parse(url), headers: headers);

      print('Response status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      if (response.statusCode != 200) {
        print('Error response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final tree = data['tree'] as List<dynamic>;
        print('Successfully received ${tree.length} files/folders');
        folderStructure.value = _buildFolderStructure(tree);
      } else if (response.statusCode == 401) {
        errorMessage.value = 'GitHub token is invalid or expired';
      } else if (response.statusCode == 404) {
        errorMessage.value = 'Repository or branch not found';
      } else {
        errorMessage.value =
            'GitHub API error: ${response.statusCode}\n${response.body}';
      }
    } catch (e, stackTrace) {
      print('Exception during GitHub API call:');
      print(e);
      print(stackTrace);
      errorMessage.value = 'Error accessing GitHub: $e';
    } finally {
      isLoadingFiles.value = false;
    }
  }

  Map<String, dynamic> _buildFolderStructure(List<dynamic> items) {
    Map<String, dynamic> structure = {};
    const ignoredFolders = ['.vscode'];

    for (var item in items) {
      final path = item['path'] as String;
      final pathParts = path.split('/');

      if (ignoredFolders.contains(pathParts[0])) continue;

      Map<String, dynamic> currentLevel = structure;
      for (int i = 0; i < pathParts.length; i++) {
        final part = pathParts[i];
        if (i == pathParts.length - 1 && item['type'] == 'blob') {
          currentLevel[part] = {
            'type': 'blob',
            'sha': item['sha'],
            'path': path,
          };
        } else {
          currentLevel[part] ??= <String, dynamic>{};
          currentLevel = currentLevel[part] as Map<String, dynamic>;
        }
      }
    }
    return structure;
  }

  Future<void> fetchFileContent(
    String sha,
    String path, {
    String? customLink,
  }) async {
    final projectData = project.value;
    if (projectData == null) return;

    final linkToUse = customLink ?? projectData.fontendLink;
    final repoOwner = GitHubParser.getRepoOwner(linkToUse);
    final repoName = GitHubParser.getRepoName(linkToUse);

    isLoadingContent.value = true;

    if (_fileContentCache.containsKey(sha)) {
      selectedFileContent.value = _fileContentCache[sha]!;
      selectedFilePath.value = path;
      isLoadingContent.value = false;
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.github.com/repos/$repoOwner/$repoName/git/blobs/$sha',
        ),
        headers: {
          'Accept': 'application/vnd.github.v3+json',
          'Authorization': 'token $_githubToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = await compute(
          _decodeFileContent,
          data['content'] as String,
        );
        _fileContentCache[sha] = content;
        selectedFileContent.value = content;
        selectedFilePath.value = path;
      } else {
        selectedFileContent.value =
            'Error loading file content: ${response.statusCode}';
        selectedFilePath.value = path;
      }
    } catch (e) {
      selectedFileContent.value = 'Error fetching file content: $e';
      selectedFilePath.value = path;
    } finally {
      isLoadingContent.value = false;
    }
  }

  static String _decodeFileContent(String base64Content) {
    final sanitizedBase64 = base64Content.replaceAll('\n', '');
    return utf8.decode(base64.decode(sanitizedBase64));
  }
}
