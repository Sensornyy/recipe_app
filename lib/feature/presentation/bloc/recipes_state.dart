part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<RecipeEntity> recipes;

  const RecipesLoaded(this.recipes);

  @override
  List<Object> get props => [recipes];
}
