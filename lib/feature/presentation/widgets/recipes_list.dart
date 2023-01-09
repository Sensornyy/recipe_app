import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/feature/presentation/widgets/loading_indicator.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(builder: (context, state) {
      List<RecipeEntity> recipes = [];

      if (state is RecipesLoading) {
        return const LoadingIndicator();
      } else if (state is RecipesLoaded) {
        recipes = state.recipes;
      }

      return ListView.separated(
        itemBuilder: (context, index) => Text(recipes[index].title),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: recipes.length,
      );
    });
  }
}
