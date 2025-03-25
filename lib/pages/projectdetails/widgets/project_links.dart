import 'dart:html' as html;
import 'package:flutter/material.dart';

class ProjectLinks extends StatelessWidget {
  final String? frontendLink;
  final String? backendLink;

  const ProjectLinks({super.key, this.frontendLink, this.backendLink});

  void _openLink(String url) {
    html.window.open(url, "_blank");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (frontendLink != null)
            GestureDetector(
              onTap: () => _openLink(frontendLink!),
              child: Text(
                'Frontend: $frontendLink',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  decoration: TextDecoration.underline, // Gạch chân giống link
                ),
              ),
            ),
          if (backendLink != null)
            GestureDetector(
              onTap: () => _openLink(backendLink!),
              child: Text(
                'Backend: $backendLink',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
