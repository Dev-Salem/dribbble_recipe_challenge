// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/loaded_recipes_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/shimmer_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dribbble_challenge/src/recipes/data/recipe_repository.dart';

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
