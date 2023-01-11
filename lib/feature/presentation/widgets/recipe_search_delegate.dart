import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/feature/presentation/widgets/loading_indicator.dart';

import 'recipe_card.dart';

class RecipeSearchDelegate extends SearchDelegate {
  RecipeSearchDelegate() : super(searchFieldLabel: 'Search for recipes...');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<RecipesBloc>(context)
        .add(SearchRecipesEvent(query));

    return BlocBuilder<RecipesBloc, RecipesState>(builder: (context, state) {
      if (state is RecipesLoading) {
        return const LoadingIndicator();
      } else if (state is RecipesLoaded) {
        final recipes = state.recipes;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: recipes.length,
          itemBuilder: (BuildContext ctx, index) {
            final sortedRecipes = recipes..sort((recipe1, recipe2) => recipe2.calories.compareTo(recipe1.calories));
            return RecipeCard(sortedRecipes[index]);
          },
        );
      }

      return const SizedBox.shrink();
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = ['Pizza', 'Soup', 'Salad'];

    if (query.isNotEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => Text(
        suggestions[index],
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
      itemCount: suggestions.length,
    );
  }
}
