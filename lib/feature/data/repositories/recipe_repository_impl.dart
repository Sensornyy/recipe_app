import 'package:recipe_app/core/platform/network_info.dart';
import 'package:recipe_app/feature/data/data_sources/recipe_local_data_source.dart';
import 'package:recipe_app/feature/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';

import '../../domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final NetworkInfo networkInfo;
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;

  RecipeRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
   required this.localDataSource,
  });

  @override
  Future<List<RecipeEntity>> searchRecipes(String query) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.searchRecipes(query);
    } else {
     return localDataSource.getRecipes();
    }
  }

  @override
  List<RecipeEntity> getRecipes() {
    return localDataSource.getRecipes();
  }
}
