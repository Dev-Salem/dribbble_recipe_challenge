// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeCardWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playDuration = 600.ms;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AnimatedImageWidget(
              imageUrl: recipe.imageUrl,
              playDuration: playDuration,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AnimatedNutritionText(
                  playDuration: playDuration,
                  nutrition: recipe.nutrition,
                ),
                _AnimatedNameWidget(
                    playDuration: playDuration, name: recipe.name),
                _AnimatedDescriptionWidget(
                    playDuration: playDuration, description: recipe.description)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedNutritionText extends StatelessWidget {
  final Duration playDuration;
  final Map<String, dynamic> nutrition;
  const _AnimatedNutritionText({
    Key? key,
    required this.playDuration,
    required this.nutrition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
              "${nutrition["calories"]}cal \t\t\t\t${nutrition["protein"]}protein",
              style: Theme.of(context).textTheme.labelMedium //label medium
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}

class _AnimatedImageWidget extends StatelessWidget {
  final Duration playDuration;
  final String imageUrl;
  const _AnimatedImageWidget({
    Key? key,
    required this.playDuration,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            constraints: const BoxConstraints(maxHeight: 150, maxWidth: 150),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ))
        .animate(delay: 400.ms)
        .shimmer(duration: playDuration - 200.ms)
        .flip();
  }
}

class _AnimatedNameWidget extends StatelessWidget {
  final Duration playDuration;
  final String name;
  const _AnimatedNameWidget({
    Key? key,
    required this.playDuration,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      alignment: Alignment.centerLeft,
      child: Text(name,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge //title large
              )
          .animate()
          .fadeIn(
              duration: 300.ms, delay: playDuration, curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class _AnimatedDescriptionWidget extends StatelessWidget {
  final Duration playDuration;
  final String description;
  const _AnimatedDescriptionWidget({
    Key? key,
    required this.playDuration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, left: 5, bottom: 10),
      constraints: const BoxConstraints(maxWidth: 150),
      child: Text(description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
              style: Theme.of(context).textTheme.labelLarge //label large
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}
