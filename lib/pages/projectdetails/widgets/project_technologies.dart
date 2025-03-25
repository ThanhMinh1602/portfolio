import 'package:flutter/material.dart';
import 'package:new_portfolio/constants/app_style.dart';

class ProjectTechnologies extends StatelessWidget {
  final List<String> technologies;

  const ProjectTechnologies({super.key, required this.technologies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technologies Used', style: AppStyle.subTitle),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              technologies.map((tech) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('- $tech', style: AppStyle.content),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
