// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dribbble_challenge/src/recipes/data/recipe_repository.dart';
import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/recipe_card_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/recipe_shimmer_card.dart';

class AnimatedRecipesWidget extends ConsumerWidget {
  final BoxConstraints constraints;
  const AnimatedRecipesWidget({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context, ref) {
    final recipes = ref.watch(recipesProvider);
    return recipes.when(
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => ShimmerLoadingList(constraints: constraints),
      data: (recipes) =>
          LoadedRecipesWidget(recipes: recipes, constraints: constraints),
    );
  }
}

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

class LoadedRecipesWidget extends StatelessWidget {
  final List<Recipe> recipes;
  final BoxConstraints constraints;
  const LoadedRecipesWidget({
    Key? key,
    required this.recipes,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                'recipe_details',
                arguments: recipes[index],
              );
            },
            child: RecipeCardWidget(
                    constraints: constraints, recipe: recipes[index])
                .animate()
                .slideX(
                    duration: 350.ms,
                    delay: (200).ms,
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOutSine),
          );
        });
  }
}
