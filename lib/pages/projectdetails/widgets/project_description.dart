import 'package:flutter/material.dart';
import 'package:new_portfolio/constants/app_style.dart';

class ProjectDescription extends StatelessWidget {
  final String description;

  const ProjectDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppStyle.subTitle),
        const SizedBox(height: 10),
        Text(description, style: AppStyle.content),
        const SizedBox(height: 30),
      ],
    );
  }
}
