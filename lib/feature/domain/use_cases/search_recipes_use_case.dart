import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';
import 'package:recipe_app/feature/domain/repositories/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase(this._recipeRepository);

  Future<List<RecipeEntity>> call(String query) async {
    return await _recipeRepository.searchRecipes(query);
  }
}
