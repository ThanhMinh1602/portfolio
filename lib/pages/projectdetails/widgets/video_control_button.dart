import 'package:flutter/material.dart';

class VideoControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const VideoControlButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 28,
        padding: const EdgeInsets.all(12),
        style: IconButton.styleFrom(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
