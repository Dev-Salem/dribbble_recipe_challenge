// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  final BoxConstraints constraints;
  const RecipeCardWidget({
    Key? key,
    required this.recipe,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.24,
      width: constraints.maxWidth,
      child: Card(
        child: LayoutBuilder(builder: (context, columnCons) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxWidth * 0.4,
                  margin: EdgeInsets.only(
                      left: columnCons.maxWidth * 0.05,
                      top: columnCons.maxHeight * 0.1),
                  child: Image.asset(
                    recipe.imageUrl,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: columnCons.maxHeight * 0.2,
                        left: columnCons.maxWidth * 0.04),
                    child: Text(
                            "${recipe.nutrition["calories"]}cal \t\t\t\t${recipe.nutrition["protein"]}protein",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium //label medium
                            )
                        .animate()
                        .scaleXY(
                            begin: 0,
                            end: 1,
                            delay: 300.ms,
                            duration: 400.ms,
                            curve: Curves.decelerate),
                  ),
                  Container(
                    width: constraints.maxWidth * 0.4,
                    padding: EdgeInsets.only(
                        top: 10, left: columnCons.maxWidth * 0.04),
                    child: Text(recipe.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge //title large
                            )
                        .animate()
                        .fadeIn(
                            duration: 300.ms,
                            delay: 450.ms,
                            curve: Curves.decelerate)
                        .slideX(begin: 0.2, end: 0),
                  ),
                  Expanded(
                    child: Container(
                      width: constraints.maxWidth * 0.4,
                      padding: EdgeInsets.only(
                          top: 10,
                          left: columnCons.maxWidth * 0.04,
                          bottom: 10),
                      child: Text(recipe.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge //label large
                              )
                          .animate()
                          .scaleXY(
                              begin: 0,
                              end: 1,
                              delay: 300.ms,
                              duration: 400.ms,
                              curve: Curves.decelerate),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
