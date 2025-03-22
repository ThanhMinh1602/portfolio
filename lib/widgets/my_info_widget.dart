import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/project_detail_page.dart';

class MyInfoWidget extends StatelessWidget {
  MyInfoWidget({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'E-Commerce App',
      'description':
          'A mobile app for online shopping built with Flutter and Firebase.',
    },
    {
      'title': 'Chat Application',
      'description': 'Real-time messaging app using WebSocket and Node.js.',
    },
    {
      'title': 'Portfolio Website',
      'description': 'A personal portfolio built with Flutter for web.',
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
          "The projects I've worked on!",
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
                      title: projects[index]['title']!,
                      description: projects[index]['description']!,
                      technologies: [
                        'Flutter',
                        'Firebase',
                        'REST API',
                      ], // Cập nhật theo dự án
                      // videoUrl:
                      //     'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                      link:
                          'https://github.com/yourprofile/${projects[index]['title']!.toLowerCase().replaceAll(' ', '-')}',
                    ),
              ),
            );
          },
          child: _buildProjectCard(
            projects[index]['title']!,
            projects[index]['description']!,
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
      width:
          screenWidth < 600
              ? screenWidth * 0.9
              : 300, // 90% chiều rộng màn hình trên điện thoại
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
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 1,
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
