import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

class GradientTextCustom extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final Duration duration;
  final TextStyle? style;

  const GradientTextCustom({
    super.key,
    required this.text,
    required this.colors,
    this.duration = const Duration(milliseconds: 1000),
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GradientAnimationText(
      text: Text(text, style: style, textAlign: TextAlign.center),
      colors: colors,
      duration: duration,
    );
  }
}
