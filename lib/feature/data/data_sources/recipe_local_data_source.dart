import 'package:hive_flutter/hive_flutter.dart';

import '../models/recipe_model.dart';

abstract class RecipeLocalDataSource {
  List<RecipeModel> getRecipes();

  void saveRecipes(List<RecipeModel> recipes);

  void removeRecipe(String title);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  late Box<List<RecipeModel>> recipesBox;

  Future<void> init() async {
    recipesBox = await Hive.openBox('recipesBox');
    recipesBox.put('recipes', <RecipeModel>[]);
  }

  @override
  List<RecipeModel> getRecipes() {
    return recipesBox.get('recipes') as List<RecipeModel>;
  }

  @override
  void saveRecipes(List<RecipeModel> recipes) {
    recipesBox.put('recipes', recipes);
  }

  @override
  void removeRecipe(String title) {
    final recipes = recipesBox.get('recipes') as List<RecipeModel>;

    recipes.removeWhere((recipe) => recipe.title == title);
  }
}
