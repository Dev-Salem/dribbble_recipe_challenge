import 'package:dribbble_challenge/src/onboarding/widgets/animated_button_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_description_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_dish_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainPlayDuration = 700.ms;
    final leavesDelayDuration = 400.ms;
    final titleDelayDuration = mainPlayDuration + 50.ms;
    final descriptionDelayDuration = titleDelayDuration + 300.ms;
    final buttonDelayDuration = descriptionDelayDuration + 100.ms;
    return PixelPerfect(
      // assetPath: "assets/images/onboarding.png",
      scale: 1.68,
      child: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(builder: (context, constraint) {
            return Stack(
              children: [
                AnimatedDishWidget(
                  dishPlayDuration: mainPlayDuration,
                  leavesDelayDuration: leavesDelayDuration,
                ),
                AnimatedTitleWidget(
                    titleDelayDuration: titleDelayDuration,
                    width: constraint.maxWidth,
                    mainPlayDuration: mainPlayDuration),
                AnimatedDescriptionWidget(
                    descriptionPlayDuration: mainPlayDuration,
                    descriptionDelayDuration: descriptionDelayDuration,
                    width: constraint.maxWidth),
                AnimatedButtonWidget(
                    width: constraint.maxWidth,
                    buttonDelayDuration: buttonDelayDuration,
                    buttonPlayDuration: mainPlayDuration)
              ],
            );
          }),
        ),
      ),
    );
  }
}
