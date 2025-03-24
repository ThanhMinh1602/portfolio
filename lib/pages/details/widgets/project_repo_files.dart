import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:new_portfolio/constants/app_style.dart';

class ProjectRepoFiles extends StatefulWidget {
  final String? repoOwner;
  final String? repoName;
  final String? branch;
  final String token;

  const ProjectRepoFiles({
    super.key,
    this.repoOwner,
    this.repoName,
    this.branch,
    required this.token,
  });

  @override
  State<ProjectRepoFiles> createState() => _ProjectRepoFilesState();
}

class _ProjectRepoFilesState extends State<ProjectRepoFiles> {
  Map<String, dynamic> _folderStructure = {};
  bool _isLoadingFiles = true;
  String? _selectedFileContent;
  String? _selectedFilePath;

  @override
  void initState() {
    super.initState();
    if (widget.repoOwner != null &&
        widget.repoName != null &&
        widget.branch != null) {
      _fetchAllFiles();
    }
  }

  Future<void> _fetchAllFiles() async {
    final url =
        'https://api.github.com/repos/${widget.repoOwner}/${widget.repoName}/git/trees/${widget.branch}?recursive=1';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/vnd.github.v3+json',
          'Authorization': 'token ${widget.token}',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final tree = data['tree'] as List<dynamic>;
        print('Total items fetched: ${tree.length}');
        print('Truncated: ${data['truncated']}');

        _folderStructure = _buildFolderStructure(tree);
        print('Folder structure keys: ${_folderStructure.keys}');
        setState(() {
          _isLoadingFiles = false;
        });
      } else {
        throw Exception(
          'Failed to load repository tree: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetching repository files: $e');
      setState(() {
        _isLoadingFiles = false;
      });
    }
  }

  Map<String, dynamic> _buildFolderStructure(List<dynamic> items) {
    Map<String, dynamic> structure = {};
    const ignoredFolders = ['.vscode'];

    for (var item in items) {
      final path = item['path'] as String;
      final pathParts = path.split('/');

      if (ignoredFolders.contains(pathParts[0])) {
        continue;
      }

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

  Future<String> _fetchFileContent(String sha) async {
    final url =
        'https://api.github.com/repos/${widget.repoOwner}/${widget.repoName}/git/blobs/$sha';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/vnd.github.v3+json',
          'Authorization': 'token ${widget.token}',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final base64Content = data['content'] as String;
        final sanitizedBase64 = base64Content.replaceAll('\n', '');

        try {
          return utf8.decode(base64.decode(sanitizedBase64));
        } catch (e) {
          return 'Lỗi giải mã Base64: $e\nBase64 gốc: $base64Content';
        }
      } else {
        return 'Lỗi tải nội dung tệp: ${response.statusCode}';
      }
    } catch (e) {
      return 'Lỗi khi lấy nội dung tệp: $e';
    }
  }

  Widget _buildFolderTree(Map<String, dynamic> folder, String parentPath) {
    List<Widget> children = [];

    final sortedKeys =
        folder.keys.toList()..sort((a, b) {
          final aIsFolder = folder[a] is Map && !folder[a].containsKey('sha');
          final bIsFolder = folder[b] is Map && !folder[b].containsKey('sha');
          if (aIsFolder && !bIsFolder) return -1;
          if (!aIsFolder && bIsFolder) return 1;
          return a.compareTo(b);
        });

    for (var name in sortedKeys) {
      final value = folder[name];
      final currentPath = parentPath.isEmpty ? name : '$parentPath/$name';

      if (value is Map<String, dynamic> && value.containsKey('sha')) {
        if (value['type'] == 'blob') {
          children.add(
            GestureDetector(
              onDoubleTap: () async {
                final content = await _fetchFileContent(value['sha'] as String);
                setState(() {
                  _selectedFileContent = content;
                  _selectedFilePath = currentPath;
                });
              },
              child: ListTile(
                leading: const Icon(
                  Icons.insert_drive_file,
                  color: Colors.white70,
                ),
                title: Text(
                  name,
                  style: AppStyle.button.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      } else if (value is Map) {
        children.add(
          ExpansionTile(
            leading: const Icon(Icons.folder, color: Colors.white70),
            title: Text(
              name,
              style: AppStyle.button.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            childrenPadding: const EdgeInsets.only(left: 16.0),
            tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
            initiallyExpanded: false,
            children: [
              _buildFolderTree(value.cast<String, dynamic>(), currentPath),
            ],
          ),
        );
      }
    }

    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.repoOwner == null ||
        widget.repoName == null ||
        widget.branch == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Repository Files',
          style: AppStyle.button.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        _isLoadingFiles
            ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
            : _folderStructure.isEmpty
            ? const Text(
              'No files found in repository',
              style: TextStyle(color: Colors.white70),
            )
            : SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: _buildFolderTree(_folderStructure, ''),
                    ),
                  ),
                  _selectedFileContent == null
                      ? Expanded(
                        flex: 3,
                        child: const Center(
                          child: Text(
                            'Select a file to view its content',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      )
                      : Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  _selectedFilePath ?? 'Unknown path',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Flexible(
                                child: SyntaxView(
                                  expanded: true,
                                  code: _selectedFileContent!,
                                  syntax: Syntax.DART,
                                  syntaxTheme: SyntaxTheme.dracula(),
                                  fontSize: 14,
                                  withZoom: true,
                                  withLinesCount: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ],
              ),
            ),
      ],
    );
  }
}
