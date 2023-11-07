// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/constants/strings.dart';
import 'package:dribbble_challenge/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTitleWidget extends StatelessWidget {
  final Duration titleDelayDuration;
  final Duration mainPlayDuration;

  const AnimatedTitleWidget({
    Key? key,
    required this.titleDelayDuration,
    required this.mainPlayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text.rich(
          TextSpan(
              style: Theme.of(context).textTheme.displaySmall,
              children: const [
                TextSpan(
                  text: Strings.onBoardingTitle,
                ),
                TextSpan(
                    text: ' everyday',
                    style: TextStyle(color: AppColors.timeLineColor)),
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
