import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:recipe_app/core/platform/network_info.dart';
import 'package:recipe_app/feature/data/data_sources/recipe_local_data_source.dart';
import 'package:recipe_app/feature/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_app/feature/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/feature/domain/use_cases/search_recipes_use_case.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';

import 'feature/data/models/recipe_model.dart';
import 'feature/data/repositories/recipe_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RecipesBloc(sl()));

  sl.registerLazySingleton(() => SearchRecipesUseCase(sl()));

  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(http.Client()),
  );

  sl.registerLazySingleton<RecipeLocalDataSource>(
    () => RecipeLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

  await Hive.initFlutter();
  final Box<List<RecipeModel>> recipeBox = await Hive.openBox('recipeBox');
  recipeBox.put('recipes', <RecipeModel>[]);
  sl.registerLazySingleton(() => recipeBox);

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
