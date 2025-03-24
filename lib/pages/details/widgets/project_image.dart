import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String? imagePath;

  const ProjectImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null) return const SizedBox.shrink();
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath!),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
