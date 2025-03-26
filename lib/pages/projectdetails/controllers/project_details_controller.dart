import 'dart:convert';
import 'package:flutter/foundation.dart' show compute;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/utils/github_parser.dart';

class ProjectDetailsController extends GetxController {
  // Project data
  final project = Rx<ProjectModel?>(null);
  final isLoading = true.obs;

  // Video player state
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
}

// Extension cho việc khởi tạo project
extension ProjectInitialization on ProjectDetailsController {
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
  }
}

// Extension cho việc xử lý GitHub API
extension GitHubApiHandler on ProjectDetailsController {
  Future<void> _fetchAllFiles({String? customLink}) async {
    final projectData = project.value;
    if (projectData == null) {
      print('ProjectData is null');
      return;
    }

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

    if (repoOwner == null || repoName == null) {
      final error = 'Invalid repository URL format: $linkToUse';
      print('ERROR: $error');
      errorMessage.value = error;
      isLoadingFiles.value = false;
      return;
    }

    final url =
        'https://api.github.com/repos/$repoOwner/$repoName/git/trees/$branch?recursive=1';

    try {
      final headers = {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_githubToken',
      };
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final tree = data['tree'] as List<dynamic>;
        folderStructure.value = _buildFolderStructure(tree);
        await _preloadAllFileContents(repoOwner, repoName, tree);
      } else if (response.statusCode == 401) {
        errorMessage.value = 'GitHub token is invalid or expired';
      } else if (response.statusCode == 404) {
        errorMessage.value = 'Repository or branch not found';
      } else {
        errorMessage.value =
            'GitHub API error: ${response.statusCode}\n${response.body}';
      }
    } catch (e, stackTrace) {
      print('Exception during GitHub API call: $e');
      print(stackTrace);
      errorMessage.value = 'Error accessing GitHub: $e';
    } finally {
      isLoadingFiles.value = false;
    }
  }

  static String _decodeFileContent(String base64Content) {
    final sanitizedBase64 = base64Content.replaceAll('\n', '');
    return utf8.decode(base64.decode(sanitizedBase64));
  }

  Future<void> _preloadAllFileContents(
    String repoOwner,
    String repoName,
    List<dynamic> tree,
  ) async {
    final fileItems = tree.where((item) => item['type'] == 'blob').toList();
    print('Preloading ${fileItems.length} files...');

    final futures = fileItems.map((item) async {
      final sha = item['sha'] as String;
      final path = item['path'] as String;

      if (!_fileContentCache.containsKey(sha)) {
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
            print('Preloaded: $path');
          } else {
            _fileContentCache[sha] =
                'Error loading file: ${response.statusCode}';
            print('Failed to preload $path: ${response.statusCode}');
          }
        } catch (e) {
          _fileContentCache[sha] = 'Error preloading file: $e';
          print('Error preloading $path: $e');
        }
      }
    });

    await Future.wait(futures);
    print('All files preloaded successfully');
  }

  Future<void> fetchFileContent(
    String sha,
    String path, {
    String? customLink,
  }) async {
    isLoadingContent.value = true;
    if (_fileContentCache.containsKey(sha)) {
      selectedFileContent.value = _fileContentCache[sha]!;
      selectedFilePath.value = path;
    } else {
      selectedFileContent.value = 'File content not available';
      selectedFilePath.value = path;
    }
    isLoadingContent.value = false;
  }
}

// Extension cho việc xử lý cấu trúc thư mục và nội dung file
extension FileStructureHandler on ProjectDetailsController {
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
}
