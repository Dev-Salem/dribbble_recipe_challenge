// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/widget/annotated_scaffold.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/recipe_details/recipe_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
      // assetPath: "assets/images/recipe_details.png",
      child: LayoutBuilder(builder: (context, constraints) {
        final appBarPlayTime = 800.ms;
        final appBarDelayTime = 400.ms;
        final infoDelayTime = appBarPlayTime + appBarDelayTime - 200.ms;
        final infoPlayTime = 500.ms;
        final dishPlayTime = 600.ms;
        return TimeLineSlidingPanel(
            recipe: recipe,
            constraints: constraints,
            body: Column(
              children: [
                AnimatedAppBarWidget(
                  name: recipe.name,
                  appBarPlayTime: appBarPlayTime,
                  appBarDelayTime: appBarDelayTime,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                AnimatedDishWidget(
                  constraints: constraints,
                  imageUrl: recipe.imageUrl,
                  dishPlayTime: dishPlayTime,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.06,
                ),
                AnimatedInfoWidget(
                    nutrition: recipe.nutrition,
                    infoDelayTime: infoDelayTime,
                    infoPlayTime: infoPlayTime,
                    constraints: constraints),
              ],
            ));
      }),
    );
  }
}
