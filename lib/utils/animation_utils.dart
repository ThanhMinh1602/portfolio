import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationUtils {
  static Widget slideUpAnimation({
    required Widget child,
    double beginOffset = 1, // Starting offset (from below)
    Duration duration = const Duration(milliseconds: 700), // Animation duration
    Duration delay = const Duration(milliseconds: 0), // Delay before starting
  }) {
    return child
        .animate()
        .slideY(
          begin: beginOffset,
          end: 0.0,
          duration: duration,
          delay: delay,
          curve: Curves.easeInOut, // Smooth easing for natural feel
        )
        .fadeIn(duration: duration, delay: delay);
  }
}
