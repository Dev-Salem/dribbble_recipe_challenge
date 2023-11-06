// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/food_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCategoryList extends StatelessWidget {
  final Duration categoryListPlayDuration;
  final Duration categoryListDelayDuration;
  const AnimatedCategoryList({
    Key? key,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        children:
            List.generate(_categories.length, (index) => _categories[index])
                .animate(interval: 100.ms, delay: categoryListDelayDuration)
                .slideX(
                    duration: categoryListPlayDuration,
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutSine),
      ),
    );
  }
}

const _categories = [
  FoodCategoryWidget(icon: "🔥", name: "Popular"),
  FoodCategoryWidget(icon: "🥦", name: "Healthy"),
  FoodCategoryWidget(icon: "🍲", name: "Soup"),
  FoodCategoryWidget(icon: "🍿", name: "Snacks"),
];
