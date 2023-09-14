// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dribbble_challenge/src/recipes/data/recipe_repository.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_card_widget.dart';

class AnimatedRecipesList extends ConsumerWidget {
  final BoxConstraints constraints;
  const AnimatedRecipesList({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context, ref) {
    final result = ref.watch(recipesProvider);
    return result.when(
        data: (recipes) => ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) => RecipeCardWidget(
                recipe: recipes[index],
                index: index,
                constraints: constraints,
              ).animate().slideX(
                  duration: 300.ms,
                  delay: (200).ms,
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutSine),
            ),
        error: (e, a) => const SizedBox(),
        loading: () => const SizedBox());
  }
}
