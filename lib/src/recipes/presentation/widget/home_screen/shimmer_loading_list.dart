import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/recipe_shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerLoadingList extends StatelessWidget {
  final BoxConstraints constraints;
  const ShimmerLoadingList({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return RecipeShimmerCard(constraints: constraints).animate().slideX(
              duration: 350.ms,
              delay: (200).ms,
              begin: 1,
              end: 0,
              curve: Curves.easeInOutSine);
        });
  }
}
