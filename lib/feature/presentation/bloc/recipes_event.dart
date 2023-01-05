part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();
}

class SearchRecipesEvent extends RecipesEvent {
  final String query;

  const SearchRecipesEvent(this.query);

  @override
  List<Object> get props => [query];
}
