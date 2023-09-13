import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedNameWidget extends StatelessWidget {
  const AnimatedNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 25,
        child: const Text(
          "Hello, \nWorld 👋 ",
          maxLines: 2,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )
            .animate()
            .slideX(
                begin: 0.2,
                end: 0,
                duration: 400.ms,
                delay: 450.ms + 500.ms,
                curve: Curves.fastOutSlowIn)
            .fadeIn());
  }
}
