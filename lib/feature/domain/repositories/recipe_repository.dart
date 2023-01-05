import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<List<RecipeEntity>> getRecipes();
  Future<List<RecipeEntity>> searchRecipes(String query);
}