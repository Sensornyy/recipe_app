import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/recipe_entity.dart';
import '../../domain/use_cases/search_recipes_use_case.dart';

part 'recipes_event.dart';

part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final SearchRecipesUseCase searchRecipes;

  RecipesBloc(this.searchRecipes) : super(RecipesInitial()) {
    on<SearchRecipesEvent>((event, emit) async {
      emit(RecipesLoading());

      final recipes = await searchRecipes(event.query);

      emit(RecipesLoaded(recipes));
    });

    on<GetRecipesEvent>((event, emit) {
      emit(RecipesLoading());
      final recipes = searchRecipes.getRecipes();
      emit(RecipesLoaded(recipes));
    });
  }
}
