// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dribbble_challenge/src/recipes/data/recipe_repository.dart';
import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
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
        data: (recipes) =>
            _LoadedRecipeList(recipes: recipes, constraints: constraints),
        error: (e, a) => Center(
              child: Text("Error: ${e.toString()}"),
            ),
        loading: () => _ShimmerLoadingList(constraints: constraints));
  }
}

class _ShimmerLoadingList extends StatelessWidget {
  final BoxConstraints constraints;
  const _ShimmerLoadingList({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RecipeShimmerCard(constraints: constraints),
        RecipeShimmerCard(constraints: constraints),
        RecipeShimmerCard(constraints: constraints),
      ].animate(interval: 300.ms).slideX(
          duration: 300.ms, begin: 1, end: 0, curve: Curves.easeInOutSine),
    );
  }
}

class _LoadedRecipeList extends StatelessWidget {
  final List<Recipe> recipes;
  final BoxConstraints constraints;
  const _LoadedRecipeList({
    Key? key,
    required this.recipes,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) => RecipeCardWidget(
        recipe: recipes[index],
        index: index,
        constraints: constraints,
      ).animate().slideX(
          duration: 300.ms,
          delay: (index * 0.3 * 200).ms,
          begin: 1,
          end: 0,
          curve: Curves.easeInOutSine),
    );
  }
}
