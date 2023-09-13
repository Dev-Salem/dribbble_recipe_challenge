import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedNameWidget extends StatelessWidget {
  final Duration namePlayDuration;
  final Duration nameDelayDuration;
  final BoxConstraints constraints;
  const AnimatedNameWidget(
      {super.key,
      required this.namePlayDuration,
      required this.nameDelayDuration,
      required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 25,
        top: constraints.maxHeight * 0.025,
        child: const Text(
          "Hello, \nWorld 👋 ",
          maxLines: 2,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )
            .animate()
            .slideX(
                begin: 0.2,
                end: 0,
                duration: namePlayDuration,
                delay: nameDelayDuration,
                curve: Curves.fastOutSlowIn)
            .fadeIn());
  }
}
