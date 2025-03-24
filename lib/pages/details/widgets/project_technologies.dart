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
        Text(
          'Technologies Used',
          style: AppStyle.button.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              technologies.map((tech) {
                return Chip(
                  label: Text(
                    tech,
                    style: AppStyle.button.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
