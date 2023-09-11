// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/constants/strings.dart';
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
          child: Container(
            width: width,
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 30),
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
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: const Text(Strings.onBoardingButton,
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
