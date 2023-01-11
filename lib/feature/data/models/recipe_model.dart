import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.label,
    required super.calories,
    required super.image,
    required super.ingredientLines,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}
