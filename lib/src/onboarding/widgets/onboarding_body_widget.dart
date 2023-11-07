import 'package:dribbble_challenge/src/onboarding/widgets/onboarding_screen_widgets.dart';
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

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
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
    final buttonPlayDuration = mainPlayDuration - 200.ms;
    return Column(
      children: [
        const Flexible(
          child: SizedBox(
            height: 50,
          ),
        ),
        Flexible(
          flex: 6,
          child: AnimatedDishWidget(
            dishPlayDuration: mainPlayDuration,
            leavesDelayDuration: leavesDelayDuration,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          flex: 2,
          child: AnimatedTitleWidget(
              titleDelayDuration: titleDelayDuration,
              mainPlayDuration: mainPlayDuration),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          flex: 1,
          child: AnimatedDescriptionWidget(
            descriptionPlayDuration: mainPlayDuration,
            descriptionDelayDuration: descriptionDelayDuration,
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              _controller.forward();
              _controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Future.delayed(400.ms, () {
                    Navigator.of(context).pushNamed('home');
                  });
                }
              });
            },
            child: AnimatedButtonWidget(
                buttonDelayDuration: buttonDelayDuration,
                buttonPlayDuration: buttonPlayDuration),
          ),
        )
      ],
    )
        .animate(
          autoPlay: false,
          controller: _controller,
        )
        .blurXY(begin: 0, end: 25, duration: 600.ms, curve: Curves.easeInOut)
        .scaleXY(begin: 1, end: 0.6)
        .fadeOut(
          begin: 1,
        );
  }
}
