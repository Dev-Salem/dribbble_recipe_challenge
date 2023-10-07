import 'package:dribbble_challenge/src/core/theme/app_colors.dart';
import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/ingredients_card_list.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimatedSlidingPanel extends AnimatedWidget {
  final Recipe recipe;
  final Widget body;
  final double screenHeight;
  final AnimationController ingredientController;
  final Duration baseDelayTime;
  final Duration slidingDuration;
  const AnimatedSlidingPanel(
      {super.key,
      required this.recipe,
      required this.body,
      required this.screenHeight,
      required this.ingredientController,
      required this.baseDelayTime,
      required this.slidingDuration,
      required super.listenable});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        header: Container(
          height: 8,
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 20),
          margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white24),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: AppColors.cardColor,
        maxHeight: screenHeight * 0.53,
        minHeight: screenHeight * (listenable as Animation<double>).value,
        borderRadius: BorderRadius.circular(30),
        body: body,
        panel: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            IngredientsCardList(
              ingredientController: ingredientController,
              recipe: recipe,
              delayTime: baseDelayTime,
              slidingDuration: slidingDuration,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.white54,
            ),
            Expanded(child: TimeLineWidget(steps: recipe.steps))
          ],
        ));
  }
}
