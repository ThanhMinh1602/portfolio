import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:get/get.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/pages/projectdetails/controllers/project_detail_controller.dart';
import 'package:new_portfolio/utils/github_parser.dart';

class ProjectRepoFiles extends StatelessWidget {
  final String? repoLink;
  final String? branch;
  final bool isBackend;

  const ProjectRepoFiles({
    super.key,
    this.repoLink,
    this.branch,
    this.isBackend = false,
  });

  Widget _buildFolderTree(
    Map<String, dynamic> folder,
    String parentPath,
    ProjectDetailController controller,
  ) {
    final sortedKeys =
        folder.keys.toList()..sort((a, b) {
          final aIsFolder = folder[a] is Map && !folder[a].containsKey('sha');
          final bIsFolder = folder[b] is Map && !folder[b].containsKey('sha');
          if (aIsFolder && !bIsFolder) return -1;
          if (!aIsFolder && bIsFolder) return 1;
          return a.compareTo(b);
        });

    return Column(
      children:
          sortedKeys.map((name) {
            final value = folder[name];
            final currentPath = parentPath.isEmpty ? name : '$parentPath/$name';

            if (value is Map<String, dynamic> && value.containsKey('sha')) {
              if (value['type'] == 'blob') {
                return ListTile(
                  onTap:
                      () => controller.fetchFileContent(
                        value['sha'],
                        currentPath,
                        customLink: repoLink,
                      ),
                  leading: const Icon(
                    Icons.insert_drive_file,
                    color: Colors.white70,
                  ),
                  title: Text(
                    name,
                    style: AppStyle.subTitle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            } else if (value is Map) {
              return ExpansionTile(
                leading: const Icon(Icons.folder, color: Colors.white70),
                title: Text(
                  name,
                  style: AppStyle.subTitle.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                childrenPadding: const EdgeInsets.only(left: 16.0),
                tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
                children: [
                  _buildFolderTree(
                    value.cast<String, dynamic>(),
                    currentPath,
                    controller,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final repoOwner = GitHubParser.getRepoOwner(repoLink);
    final repoName = GitHubParser.getRepoName(repoLink);
    final tag = '$repoOwner-$repoName-$branch';

    Get.put(
      ProjectDetailController(
        projectModel: ProjectModel(
          title: '',
          description: '',
          technologies: [],
          features: [],
          fontendLink: repoLink,
          branch: branch,
        ),
      ),
      tag: tag,
    );

    return Obx(() {
      final controller = Get.find<ProjectDetailController>(tag: tag);
      print(
        'UI rebuilding with isLoadingFiles: ${controller.isLoadingFiles.value}',
      );

      if (repoOwner == null || repoName == null || branch == null) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ), // Sửa lỗi cú pháp padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${isBackend ? "Backend: " : "Frontend: "}${GitHubParser.getRepoName(repoLink) ?? 'Unknown'}",
              style: AppStyle.subTitle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (controller.errorMessage.isNotEmpty)
              Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.redAccent),
              )
            else if (controller.isLoadingFiles.value)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            else if (controller.folderStructure.isEmpty)
              const Text(
                'No files found in repository',
                style: TextStyle(color: Colors.white70),
              )
            else
              Container(
                height:
                    MediaQuery.of(context).size.height *
                    0.8, // Giới hạn chiều cao
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildFolderTree(
                            controller.folderStructure,
                            '',
                            controller,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child:
                          controller.isLoadingContent.value
                              ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                              : controller.selectedFileContent.value.isEmpty
                              ? const Center(
                                child: Text(
                                  'Select a file to view its content',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.selectedFilePath.value.isEmpty
                                          ? 'Unknown path'
                                          : controller.selectedFilePath.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: SyntaxView(
                                      code:
                                          controller.selectedFileContent.value,
                                      syntax:
                                          isBackend
                                              ? Syntax.JAVASCRIPT
                                              : Syntax.DART,
                                      syntaxTheme: SyntaxTheme.dracula(),
                                      fontSize: 16,
                                      withZoom: true,
                                      withLinesCount: true,
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
