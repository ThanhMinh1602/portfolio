import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/details/pages/project_detail_page.dart';

class MyInfoWidget extends StatelessWidget {
  MyInfoWidget({super.key});

  final List<ProjectModel> projects = [
    ProjectModel(
      title: 'To Do',
      description:
          'A task management app with authentication and CRUD operations, built with clean architecture and automated CI/CD.',
      technologies: [
        'Flutter',
        'Firebase',
        'Bloc State Management',
        'Clean Architecture',
        'GitHub Actions (CI/CD)',
        'Unit Test',
        'Integration Test',
      ],
      features: [
        'Authentication (Login, Logout, Send OTP, Register, Forgot Password, Change Password)',
        'CRUD operations for tasks (Create, Read, Update, Delete)',
        'Unit and integration testing',
        'Continuous Integration/Continuous Deployment (CI/CD) via GitHub Actions',
      ],
      videoUrl: 'assets/videos/video1.mp4',
      branch: 'main',
      fontendLink: 'https://github.com/ThanhMinhProjects/todo_bloc.git',
      timeline: 'Dec 2024 - Present', // Thêm timeline
    ),
    ProjectModel(
      title: 'Momentsy',
      description:
          'A mobile application that enables users to capture photos, share moments, chat in real-time, and connect with friends via QR codes.',
      technologies: [
        'Flutter',
        'GetX',
        'MVVM',
        'Node.js',
        'Express.js',
        'WebSocket',
        'Google Cloud',
        'Google Drive API',
      ],
      features: [
        'Authentication (Login, Logout, Registration, Forgot Password, Change Password, OTP Sending)',
        'Photo capture and upload to Google Drive',
        'Real-time messaging with WebSocket',
        'Add friends via QR code',
        'Push notifications',
        'User profile updates',
      ],
      videoUrl: 'assets/videos/video1.mp4',
      branch: 'main',
      fontendLink: 'https://github.com/ThanhMinh1602/momentsy',
      backendLink: 'https://github.com/ThanhMinh1602/doodle_mood_server',
      timeline: 'Early March 2025 - Present',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        _buildTitle(screenWidth),
        SizedBox(height: screenWidth < 600 ? 20 : 40),
        _buildProjectList(context, screenWidth),
      ],
    );
  }

  Widget _buildTitle(double screenWidth) {
    return Wrap(
      children: [
        SizedBox(width: screenWidth < 600 ? 10 : 195),
        Text(
          "Projects & Experiences",
          textAlign: TextAlign.center,
          style: AppStyle.title.copyWith(fontSize: screenWidth < 600 ? 28 : 36),
        ),
        SvgPicture.asset(Assets.icons.star, width: screenWidth < 600 ? 20 : 30),
      ],
    );
  }

  Widget _buildProjectList(BuildContext context, double screenWidth) {
    return Wrap(
      spacing: screenWidth < 600 ? 10 : 20,
      runSpacing: screenWidth < 600 ? 10 : 20,
      alignment: WrapAlignment.center,
      children: List.generate(
        projects.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        ProjectDetailPage(projectModel: projects[index]),
              ),
            );
          },
          child: _buildProjectCard(
            projects[index].title,
            projects[index].description,
            screenWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    double screenWidth,
  ) {
    return Container(
      width: screenWidth < 600 ? screenWidth * 0.9 : 300,
      height: screenWidth < 600 ? 150 : 180,
      padding: EdgeInsets.all(screenWidth < 600 ? 15 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff82B4FF).withOpacity(0.2),
            Color(0xffBFF0FF).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: AppColor.skyGradient),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.button.copyWith(
              fontSize: screenWidth < 600 ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
            child: Text(
              description,
              style: AppStyle.button.copyWith(
                fontSize: screenWidth < 600 ? 12 : 14,
                color: Colors.white70,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              Assets.icons.star,
              width: screenWidth < 600 ? 16 : 20,
            ),
          ),
        ],
      ),
    );
  }
}
