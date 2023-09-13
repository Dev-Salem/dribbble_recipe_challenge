import 'package:dribbble_challenge/src/recipes/presentation/widget/food_category_widget.dart';
import 'package:flutter/material.dart';

class AnimatedCategoryList extends StatelessWidget {
  const AnimatedCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [FoodCategoryWidget()],
      ),
    );
  }
}
