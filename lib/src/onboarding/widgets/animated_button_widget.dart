// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedButtonWidget extends StatelessWidget {
  final double width;
  final Duration buttonDelayDuration;
  final Duration buttonPlayDuration;
  const AnimatedButtonWidget({
    Key? key,
    required this.width,
    required this.buttonDelayDuration,
    required this.buttonPlayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          child: Container(
            width: width * 0.8,
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(50)),
          ),
        ).animate().slideY(
            begin: 2,
            end: 0,
            delay: buttonDelayDuration,
            duration: buttonPlayDuration,
            curve: Curves.easeInOutCubic),
        Positioned(
          bottom: 45,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: const Text("Get Started",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  height: 1.4,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ).animate().scaleXY(
            begin: 0,
            end: 1,
            delay: buttonDelayDuration + 450.ms,
            duration: buttonPlayDuration,
            curve: Curves.easeInOutCubic),
      ],
    );
  }
}
