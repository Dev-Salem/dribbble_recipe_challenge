import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/recipe_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadedRecipesWidget extends StatelessWidget {
  final List<Recipe> recipes;
  const LoadedRecipesWidget({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                'recipe_details',
                arguments: recipes[index],
              );
            },
            child: RecipeCardWidget(recipe: recipes[index]).animate().slideX(
                duration: 200.ms,
                delay: 0.ms,
                begin: 1,
                end: 0,
                curve: Curves.easeInOutSine),
          );
        });
  }
}
