import 'package:flutter/material.dart';
import 'package:new_portfolio/res/constants/app_style.dart';

class ProjectFeatures extends StatelessWidget {
  final List<String> features;

  const ProjectFeatures({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Features', style: AppStyle.subTitle),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white70,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(feature, style: AppStyle.content)),
                    ],
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
