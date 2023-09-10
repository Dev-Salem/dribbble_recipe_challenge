// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTitleWidget extends StatelessWidget {
  final Duration titleDelayDuration;
  final double width;
  final Duration mainPlayDuration;

  const AnimatedTitleWidget({
    Key? key,
    required this.titleDelayDuration,
    required this.width,
    required this.mainPlayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 175,
      child: SizedBox(
        width: width,
        child: const Text.rich(
          TextSpan(
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Find the perfect recipe ',
                ),
                TextSpan(
                    text: 'everyday', style: TextStyle(color: Colors.lime)),
              ]),
          textAlign: TextAlign.center,
        ),
      ),
    )
        .animate()
        .slideY(
            begin: -0.2,
            end: 0,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic)
        .scaleXY(
            begin: 0,
            end: 1,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
