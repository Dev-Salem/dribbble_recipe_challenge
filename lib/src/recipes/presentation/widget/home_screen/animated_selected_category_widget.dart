// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedSelectedCategoryWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final Duration selectedCategoryPlayDuration;
  final Duration selectedCategoryDelayDuration;
  const AnimatedSelectedCategoryWidget({
    Key? key,
    required this.constraints,
    required this.selectedCategoryPlayDuration,
    required this.selectedCategoryDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: constraints.maxHeight * 0.25,
            left: 30,
            child: Text(
              "2003 Popular",
              style: Theme.of(context).textTheme.titleLarge,
            ))
        .animate()
        .fadeIn(
            delay: selectedCategoryDelayDuration,
            duration: selectedCategoryPlayDuration,
            curve: Curves.decelerate)
        .slideX(begin: 0.2, end: 0);
  }
}
