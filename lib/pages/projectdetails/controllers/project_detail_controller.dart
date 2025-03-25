import 'dart:convert';
import 'package:flutter/foundation.dart' show compute;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/utils/github_parser.dart';
import 'package:video_player/video_player.dart';

class ProjectDetailController extends GetxController {
  final ProjectModel projectModel;
  VideoPlayerController? videoController;
  RxBool isInitialized = false.obs;
  RxString videoError = ''.obs;

  RxMap<String, dynamic> folderStructure = <String, dynamic>{}.obs;
  RxBool isLoadingFiles = true.obs;
  RxString selectedFileContent = ''.obs;
  RxString selectedFilePath = ''.obs;
  RxBool isLoadingContent = false.obs;
  RxString errorMessage = ''.obs;
  final Map<String, String> _fileContentCache = {};
  final String? token = dotenv.env['KEY_GITHUB_API'];

  ProjectDetailController({required this.projectModel});

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
    _fetchAllFiles();
  }

  void _initializeVideo() {
    String? videoUrl = projectModel.videoUrl;
    print('Initializing video with URL: $videoUrl');
    if (videoUrl == null || videoUrl.isEmpty) {
      videoError.value = 'Video URL is null or empty';
      isInitialized.value = false;
      print('Video initialization failed: $videoError');
      return;
    }

    try {
      videoController =
          videoUrl.startsWith('https')
              ? VideoPlayerController.networkUrl(Uri.parse(videoUrl))
              : VideoPlayerController.asset(videoUrl);

      videoController!
          .initialize()
          .then((_) {
            isInitialized.value = true;
            videoController!.play();
            print('Video initialized successfully');
          })
          .catchError((error) {
            videoError.value = 'Error initializing video: $error';
            isInitialized.value = false;
            print('Video initialization failed: $videoError');
          });

      videoController!.addListener(() {
        if (videoController!.value.hasError) {
          videoError.value =
              'Video error: ${videoController!.value.errorDescription}';
          print('Video error detected: $videoError');
        }
        update();
      });
    } catch (e) {
      videoError.value = 'Unexpected error initializing video: $e';
      isInitialized.value = false;
      print('Unexpected video error: $videoError');
    }
  }

  Future<void> _fetchAllFiles({String? customLink}) async {
    final linkToUse =
        customLink ?? projectModel.fontendLink; // Ưu tiên frontend link
    final repoOwner = GitHubParser.getRepoOwner(linkToUse);
    final repoName = GitHubParser.getRepoName(linkToUse);
    final branch = projectModel.branch;

    if (repoOwner == null ||
        repoName == null ||
        branch == null ||
        token == null) {
      errorMessage.value = 'Missing repository details for $linkToUse';
      isLoadingFiles.value = false;
      return;
    }

    print('Fetching all files from $linkToUse...');
    final url =
        'https://api.github.com/repos/$repoOwner/$repoName/git/trees/$branch?recursive=1';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/vnd.github.v3+json',
          'Authorization': 'token $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final tree = data['tree'] as List<dynamic>;
        print('Total items fetched: ${tree.length}');
        print('Truncated: ${data['truncated']}');

        folderStructure.value = _buildFolderStructure(tree);
        print('Folder structure keys: ${folderStructure.keys}');
      } else {
        errorMessage.value =
            'Failed to load repository tree: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching repository files: $e';
      print('Error: $e');
    } finally {
      isLoadingFiles.value = false;
      print('Loading finished, isLoadingFiles: ${isLoadingFiles.value}');
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

  Future<String> _decodeFileContent(String base64Content) async {
    return compute((content) {
      final sanitizedBase64 = content.replaceAll('\n', '');
      return utf8.decode(base64.decode(sanitizedBase64));
    }, base64Content);
  }

  Future<void> fetchFileContent(
    String sha,
    String path, {
    String? customLink,
  }) async {
    final linkToUse = customLink ?? projectModel.fontendLink;
    final repoOwner = GitHubParser.getRepoOwner(linkToUse);
    final repoName = GitHubParser.getRepoName(linkToUse);

    print('Fetching file content for $path with sha: $sha from $linkToUse');
    isLoadingContent.value = true;

    if (_fileContentCache.containsKey(sha)) {
      selectedFileContent.value = _fileContentCache[sha]!;
      selectedFilePath.value = path;
      isLoadingContent.value = false;
      print('Loaded from cache: ${_fileContentCache[sha]}');
      return;
    }

    final url =
        'https://api.github.com/repos/$repoOwner/$repoName/git/blobs/$sha';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/vnd.github.v3+json',
          'Authorization': 'token $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final base64Content = data['content'] as String;
        final content = await _decodeFileContent(base64Content);
        _fileContentCache[sha] = content;
        selectedFileContent.value = content;
        selectedFilePath.value = path;
        print('File content loaded: $content');
      } else {
        selectedFileContent.value =
            'Error loading file content: ${response.statusCode}';
        selectedFilePath.value = path;
        print('Error loading file content: ${response.statusCode}');
      }
    } catch (e) {
      selectedFileContent.value = 'Error fetching file content: $e';
      selectedFilePath.value = path;
      print('Error fetching file content: $e');
    } finally {
      isLoadingContent.value = false;
    }
  }

  @override
  void onClose() {
    videoController?.dispose();
    super.onClose();
  }

  // Video control methods
  void playPause() {
    if (videoController != null && videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController?.play();
    }
  }

  void replay() {
    videoController?.seekTo(Duration.zero);
    videoController?.play();
  }

  void stop() {
    videoController?.pause();
    videoController?.seekTo(Duration.zero);
  }

  void fastForward() {
    if (videoController != null && isInitialized.value) {
      final currentPosition = videoController!.value.position;
      final duration = videoController!.value.duration;
      final newPosition = currentPosition + const Duration(seconds: 10);
      if (newPosition < duration) {
        videoController!.seekTo(newPosition);
      } else {
        videoController!.seekTo(duration);
      }
    }
  }

  void rewind() {
    if (videoController != null && isInitialized.value) {
      final currentPosition = videoController!.value.position;
      final newPosition = currentPosition - const Duration(seconds: 10);
      if (newPosition > Duration.zero) {
        videoController!.seekTo(newPosition);
      } else {
        videoController!.seekTo(Duration.zero);
      }
    }
  }
}
