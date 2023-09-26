// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/ingredients_card_list.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:dribbble_challenge/src/core/theme/app_colors.dart';
import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';

class TimeLineSlidingPanel extends StatelessWidget {
  final Recipe recipe;
  final Widget body;
  final double screenHeight;
  const TimeLineSlidingPanel({
    Key? key,
    required this.recipe,
    required this.body,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.cardColor,
      minHeight: screenHeight * 0.4,
      borderRadius: BorderRadius.circular(30),
      body: body,
      panel: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          IngredientsCardList(recipe: recipe),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Colors.white54,
          ),
          Expanded(child: TimeLineWidget(steps: recipe.steps))
        ],
      )
          .animate(delay: 2500.milliseconds)
          .slideX(begin: -0.5, end: 0, duration: 500.ms)
          .fadeIn(),
    );
  }
}
