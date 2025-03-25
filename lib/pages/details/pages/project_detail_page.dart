import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:new_portfolio/components/footer/footer.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/pages/details/controllers/project_detail_controller.dart';
import 'package:new_portfolio/pages/details/widgets/project_description.dart';
import 'package:new_portfolio/pages/details/widgets/project_features.dart';
import 'package:new_portfolio/pages/details/widgets/project_image.dart';
import 'package:new_portfolio/pages/details/widgets/project_repo_files.dart';
import 'package:new_portfolio/pages/details/widgets/project_technologies.dart';
import 'package:new_portfolio/pages/details/widgets/project_video.dart';
import 'package:new_portfolio/utils/github_parser.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectDetailPage({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    final frontendOwner = GitHubParser.getRepoOwner(projectModel.fontendLink);
    final frontendName = GitHubParser.getRepoName(projectModel.fontendLink);
    final backendOwner = GitHubParser.getRepoOwner(projectModel.backendLink);
    final backendName = GitHubParser.getRepoName(projectModel.backendLink);

    // Tag cho frontend controller
    final frontendTag = '$frontendOwner-$frontendName-${projectModel.branch}';
    Get.put(
      ProjectDetailController(projectModel: projectModel),
      tag: frontendTag,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          projectModel.title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectDescription(description: projectModel.description),
              ProjectFeatures(features: projectModel.features),
              ProjectTechnologies(technologies: projectModel.technologies),
              // if (projectModel.videoUrl != null)
              //   ProjectVideo(
              //     videoUrl: projectModel.videoUrl,
              //     onPlayPause:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).playPause,
              //     onReplay:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).replay,
              //     onStop:
              //         Get.find<ProjectDetailController>(tag: frontendTag).stop,
              //     onFastForward:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).fastForward,
              //     onRewind:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).rewind,
              //     controller:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).videoController,
              //     isInitialized:
              //         Get.find<ProjectDetailController>(
              //           tag: frontendTag,
              //         ).isInitialized.value,
              //   ),
              if (projectModel.fontendLink != null)
                ProjectRepoFiles(
                  repoLink: projectModel.fontendLink,
                  branch: projectModel.branch,
                ),
              if (projectModel.backendLink != null)
                ProjectRepoFiles(
                  repoLink:
                      projectModel
                          .backendLink, // Dùng backendLink như frontend để lấy repo
                  branch: projectModel.branch,
                  isBackend: true, // Thêm flag để phân biệt backend
                ),
              if (projectModel.timeline != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Timeline: ${projectModel.timeline}',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              if (projectModel.fontendLink != null ||
                  projectModel.backendLink != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (projectModel.fontendLink != null)
                        Text(
                          'Frontend: ${projectModel.fontendLink}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      if (projectModel.backendLink != null)
                        Text(
                          'Backend: ${projectModel.backendLink}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              FooterWidget(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
    );
  }
}
