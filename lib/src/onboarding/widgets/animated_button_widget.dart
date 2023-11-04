// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:dribbble_challenge/src/core/constants/strings.dart';
import 'package:dribbble_challenge/src/core/theme/app_colors.dart';

class AnimatedButtonWidget extends StatelessWidget {
  final Duration buttonDelayDuration;
  final Duration buttonPlayDuration;
  const AnimatedButtonWidget({
    Key? key,
    required this.buttonDelayDuration,
    required this.buttonPlayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.onBoardingButtonColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: AnimatedTextWidget(
                      buttonPlayDuration: buttonPlayDuration,
                      buttonDelayDuration: buttonDelayDuration))
              .animate()
              .slideY(
                  begin: 2,
                  end: 0,
                  delay: buttonDelayDuration,
                  duration: buttonPlayDuration,
                  curve: Curves.easeInOutCubic),
        )
      ],
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  final Duration buttonPlayDuration;
  final Duration buttonDelayDuration;
  const AnimatedTextWidget({
    Key? key,
    required this.buttonPlayDuration,
    required this.buttonDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(Strings.onBoardingButton,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge),
    ).animate().scaleXY(
        begin: 0,
        end: 1,
        delay: buttonDelayDuration + 300.ms,
        duration: buttonPlayDuration,
        curve: Curves.easeInOutCubic);
  }
}
