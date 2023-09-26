import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe(
      {required String name,
      required String description,
      required String imageUrl,
      required Map<String, num> nutrition,
      required List<String> ingredients,
      required List<String> steps,
      required String id}) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
