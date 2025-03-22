import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/widgets/gradient_text_custom.dart';

class SkillWidget extends StatelessWidget {
  SkillWidget({super.key});

  final Map<String, List<String>> skillCategories = {
    'Programming Languages': ['Dart', 'JavaScript', 'Kotlin'],
    'Frameworks & Libraries': [
      'Flutter',
      'Node.js',
      'BLoC',
      'Provider',
      'GetX',
    ],
    'Architectures': ['OOP', 'Clean Architecture', 'MVC', 'MVVM'],
    'Databases': ['SQLite', 'Firebase', 'MongoDB', 'Shared Preferences'],
    'APIs & Tools': ['REST API', 'Swagger UI', 'WebSocket', 'Postman'],
    'Testing': ['Unit Test', 'Integration Test'],
    'DevOps & Collaboration': [
      'Git',
      'GitHub Actions',
      'Backlog',
      'Team collaboration',
    ],
    'Others': ['English technical reading comprehension', 'Android (Kotlin)'],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: screenWidth < 600 ? screenWidth : 1050,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 10.0 : 16.0,
            vertical: screenWidth < 600 ? 20.0 : 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Skills',
                style: AppStyle.title.copyWith(
                  fontSize: screenWidth < 600 ? 28 : 36,
                ),
              ),
              SizedBox(height: screenWidth < 600 ? 20 : 40),
              ...skillCategories.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      entry.key,
                      style: AppStyle.button.copyWith(
                        fontSize: screenWidth < 600 ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: screenWidth < 600 ? 8 : 12,
                      runSpacing: screenWidth < 600 ? 8 : 12,
                      alignment: WrapAlignment.center,
                      children:
                          entry.value.map((skill) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth < 600 ? 15 : 20,
                                vertical: screenWidth < 600 ? 8 : 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(
                                    colors: AppColor.grapeGradient,
                                  ),
                                  width: 2,
                                ),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: GradientTextCustom(
                                text: skill,
                                colors: AppColor.limeGradient,
                                style: AppStyle.button.copyWith(
                                  fontSize: screenWidth < 600 ? 12 : 14,
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: screenWidth < 600 ? 20 : 32),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
