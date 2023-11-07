// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedDescriptionWidget extends StatelessWidget {
  final Duration descriptionPlayDuration;
  final Duration descriptionDelayDuration;
  const AnimatedDescriptionWidget({
    Key? key,
    required this.descriptionPlayDuration,
    required this.descriptionDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Text(
          Strings.onBoardingSlogan,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
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
                curve: Curves.easeInOutCubic));
  }
}
