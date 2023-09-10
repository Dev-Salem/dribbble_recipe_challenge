// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedDescriptionWidget extends StatelessWidget {
  final Duration descriptionPlayDuration;
  final Duration descriptionDelayDuration;
  final double width;
  const AnimatedDescriptionWidget({
    Key? key,
    required this.descriptionPlayDuration,
    required this.descriptionDelayDuration,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: const Text(
            "More than 20 thousands recipes of healthy and delicious food",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.4,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
    )
        .animate()
        .slideY(
            begin: 0.1,
            end: 0,
            delay: 350.ms + 400.ms,
            duration: descriptionPlayDuration,
            curve: Curves.easeInOutCubic)
        .scaleXY(
            begin: 0,
            end: 1,
            delay: descriptionDelayDuration,
            duration: descriptionPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
