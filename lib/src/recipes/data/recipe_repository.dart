import 'dart:convert';

import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeRepository {
  Future<List<Recipe>> loadRecipes(
      {String filePath = "assets/recipes.json"}) async {
    final response = await rootBundle.loadString(filePath);
    final recipes =
        (jsonDecode(response) as List).map((e) => Recipe.fromJson(e)).toList();
    return recipes;
  }
}

final repositoryProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepository();
});

final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  return ref.watch(repositoryProvider).loadRecipes();
});
