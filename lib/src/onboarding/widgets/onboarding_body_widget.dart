import 'package:dribbble_challenge/src/onboarding/widgets/animated_button_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_description_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_dish_widget.dart';
import 'package:dribbble_challenge/src/onboarding/widgets/animated_title_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingBodyWidget extends StatefulWidget {
  const OnBoardingBodyWidget({super.key});

  @override
  State<OnBoardingBodyWidget> createState() => _OnBoardingBodyWidgetState();
}

class _OnBoardingBodyWidgetState extends State<OnBoardingBodyWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _showHomeScreen = false;
  void changeScreen() {
    setState(() {
      _showHomeScreen = true;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          changeScreen();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainPlayDuration = 1000.ms;
    final leavesDelayDuration = 600.ms;
    final titleDelayDuration = mainPlayDuration + 50.ms;
    final descriptionDelayDuration = titleDelayDuration + 300.ms;
    final buttonDelayDuration = descriptionDelayDuration + 100.ms;

    return _showHomeScreen
        ? const HomeScreen()
        : LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: [
                SizedBox(
                  height: constraint.maxHeight * 0.60,
                  child: AnimatedDishWidget(
                    dishPlayDuration: mainPlayDuration,
                    leavesDelayDuration: leavesDelayDuration,
                  ),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.12,
                  child: AnimatedTitleWidget(
                      titleDelayDuration: titleDelayDuration,
                      width: constraint.maxWidth,
                      mainPlayDuration: mainPlayDuration),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.02,
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.07,
                  child: AnimatedDescriptionWidget(
                      descriptionPlayDuration: mainPlayDuration,
                      descriptionDelayDuration: descriptionDelayDuration,
                      width: constraint.maxWidth),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.03,
                ),
                SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.forward();
                      });
                    },
                    child: AnimatedButtonWidget(
                        width: constraint.maxWidth,
                        buttonDelayDuration: buttonDelayDuration,
                        buttonPlayDuration: mainPlayDuration),
                  ),
                )
              ],
            )
                .animate(
                  autoPlay: false,
                  controller: _controller,
                )
                .blurXY(
                    begin: 0,
                    end: 25,
                    duration: 600.ms,
                    curve: Curves.easeInOut)
                .scaleXY(begin: 1, end: 0.6)
                .fadeOut(
                  begin: 1,
                );
          });
  }
}
