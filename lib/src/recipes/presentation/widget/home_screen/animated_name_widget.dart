import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedNameWidget extends StatelessWidget {
  final Duration namePlayDuration;
  final Duration nameDelayDuration;
  const AnimatedNameWidget({
    super.key,
    required this.namePlayDuration,
    required this.nameDelayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello, \nWorld 👋 ",
      maxLines: 2,
      style: Theme.of(context).textTheme.headlineMedium,
    )
        .animate()
        .slideX(
            begin: 0.2,
            end: 0,
            duration: namePlayDuration,
            delay: nameDelayDuration,
            curve: Curves.fastOutSlowIn)
        .fadeIn();
  }
}
