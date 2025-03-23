import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/project_detail_page.dart';

class MyInfoWidget extends StatelessWidget {
  MyInfoWidget({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'To Do',
      'description':
          'A task management app with authentication and CRUD operations.',
      'technologies': [
        'Flutter',
        'Firebase',
        'BLoC',
        'Clean Architecture',
        'GitHub Actions',
      ],
      'link': 'https://github.com/ThanhMinhProjects/todo_bloc.git',
    },
    {
      'title': 'Momentsy',
      'description':
          'A mobile app for capturing photos, sharing moments, and real-time chat.',
      'technologies': [
        'Flutter',
        'GetX',
        'Node.js',
        'WebSocket',
        'Google Cloud',
      ],
      'link': 'https://github.com/ThanhMinh1602/momentsy',
    },
    {
      'title': 'Aloo',
      'description': 'A sim card selling app for Vietnamese people in Japan.',
      'technologies': ['Flutter', 'Firebase', 'Python'],
      'link': 'https://play.google.com/store/apps/details?id=jp.aloo',
    },
    {
      'title': 'Rikai Assistant',
      'description': 'A chat bot for task progress reporting on Google Chat.',
      'technologies': ['Express.js', 'MySQL', 'Docker', 'Google Cloud'],
      'link': null,
    },
    {
      'title': 'Global Camera',
      'description': 'An app for streaming and managing camera videos on AWS.',
      'technologies': ['Flutter', 'PHP Laravel', 'AWS'],
      'link': null,
    },
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
                    (context) => ProjectDetailPage(
                      title: projects[index]['title'],
                      description: projects[index]['description'],
                      technologies: projects[index]['technologies'],
                      link: projects[index]['link'],
                    ),
              ),
            );
          },
          child: _buildProjectCard(
            projects[index]['title'],
            projects[index]['description'],
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
