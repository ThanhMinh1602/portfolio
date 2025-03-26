import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_portfolio/components/footer/footer.dart';
import 'package:new_portfolio/pages/projectdetails/controllers/project_details_controller.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_description.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_features.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_links.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_repo_files.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_technologies.dart';

class ProjectDetailsPage extends StatelessWidget {
  ProjectDetailsPage({super.key});
  final project = Get.find<ProjectDetailsController>().project.value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          project!.title,
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
              ProjectDescription(description: project!.description),
              ProjectFeatures(features: project!.features),
              ProjectTechnologies(technologies: project!.technologies),
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
              if (project!.fontendLink != null)
                ProjectRepoFiles(
                  repoLink: project!.fontendLink,
                  branch: project!.branch,
                ),
              if (project!.backendLink != null)
                ProjectRepoFiles(
                  repoLink: project!.backendLink,
                  branch: project!.branch,
                  isBackend: true,
                ),
              if (project!.timeline != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Timeline: ${project!.timeline}',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              if (project!.fontendLink != null || project!.backendLink != null)
                ProjectLinks(
                  frontendLink: project!.fontendLink,
                  backendLink: project!.backendLink,
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
