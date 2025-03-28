import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_portfolio/res/components/footer/footer.dart';
import 'package:new_portfolio/pages/projectdetails/controllers/project_details_controller.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_description.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_features.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_links.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_repo_files.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_technologies.dart';
import 'package:new_portfolio/pages/projectdetails/widgets/project_video.dart';
import 'package:new_portfolio/res/constants/app_style.dart';

class ProjectDetailsPage extends StatelessWidget {
  ProjectDetailsPage({super.key});
  final project = Get.find<ProjectDetailsController>().project.value;
  @override
  Widget build(BuildContext context) {
    if (project == null) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: Center(
          child: Text('Project not found', style: AppStyle.subTitle),
        ),
      );
    }
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectDescription(description: project!.description),
                  ProjectFeatures(features: project!.features),
                  ProjectTechnologies(technologies: project!.technologies),

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
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (project!.fontendLink != null ||
                      project!.backendLink != null)
                    ProjectLinks(
                      frontendLink: project!.fontendLink,
                      backendLink: project!.backendLink,
                    ),
                  if (project!.videoUrl != null)
                    ProjectVideo(videoUrl: project!.videoUrl!),
                ],
              ),
            ),
            const SizedBox(height: 30),
            FooterWidget(),
          ],
        ),
      ),
      // ignore: deprecated_member_use
      backgroundColor: Colors.black.withOpacity(0.9),
    );
  }
}
