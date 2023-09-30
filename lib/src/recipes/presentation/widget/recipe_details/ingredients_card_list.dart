// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/ingredient_card_widget.dart';

class IngredientsCardList extends StatelessWidget {
  final Recipe recipe;
  final Duration delayTime;
  final Duration slidingDuration;
  final AnimationController ingredientController;
  const IngredientsCardList({
    Key? key,
    required this.recipe,
    required this.delayTime,
    required this.slidingDuration,
    required this.ingredientController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: recipe.ingredients.length,
          //physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              IngredientCardWidget(ingredient: recipe.ingredients[index])
                  .animate(controller: ingredientController, autoPlay: false)
                  .scaleXY(
                      begin: 0,
                      end: 1,
                      duration: 500.ms,
                      delay: (200 * index).ms,
                      curve: Curves.decelerate)
                  .fadeIn()),
    );
  }
}
