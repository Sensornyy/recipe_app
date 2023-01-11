
import 'package:hive/hive.dart';

import '../models/recipe_model.dart';

abstract class RecipeLocalDataSource {
  List<RecipeModel> getRecipes();

  void saveRecipes(List<RecipeModel> recipes);

  void removeRecipe(String title);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
   final Box<List<RecipeModel>> recipesBox;

   RecipeLocalDataSourceImpl(this.recipesBox);

  @override
  List<RecipeModel> getRecipes() {
    return recipesBox.get('recipes') as List<RecipeModel>;
  }

  @override
  void saveRecipes(List<RecipeModel> recipes) {
    recipesBox.put('recipes', recipes);
  }

  @override
  void removeRecipe(String label) {
    final recipes = getRecipes();

    recipes.removeWhere((recipe) => recipe.label == label);

    saveRecipes(recipes);
  }
}
