import 'package:hive_flutter/hive_flutter.dart';

import '../models/recipe_model.dart';

abstract class RecipeLocalDataSource {
  Future<List<RecipeModel>> getRecipes();
  Future<void> saveRecipes(List<RecipeModel> recipes);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  late Box<RecipeModel> recipesBox;

  Future<void> init() async {
    Hive.registerAdapter(RecipeAdapter());
  }

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final recipesBox = await Hive.openBox('recipes');

    final recipes = recipesBox.get('');

    throw UnimplementedError();
  }

  @override
  Future<void> saveRecipes(List<RecipeModel> recipes) {
    // TODO: implement recipesToCache
    throw UnimplementedError();
  }
}