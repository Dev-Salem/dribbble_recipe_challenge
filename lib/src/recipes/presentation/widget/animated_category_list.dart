// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:dribbble_challenge/src/recipes/presentation/widget/food_category_widget.dart';

class AnimatedCategoryList extends StatelessWidget {
  final BoxConstraints constraints;
  final Duration categoryListPlayDuration;
  final Duration categoryListDelayDuration;
  const AnimatedCategoryList({
    Key? key,
    required this.constraints,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: constraints.maxHeight * 0.16,
        height: 45,
        width: constraints.maxWidth,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 15),
          children: List.generate(
                  4,
                  (index) => const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: FoodCategoryWidget(),
                      ))
              .animate(interval: 100.ms, delay: categoryListDelayDuration)
              .slideX(
                  duration: categoryListPlayDuration,
                  begin: 3,
                  end: 0,
                  curve: Curves.easeInOutSine),
        ));
  }
}
