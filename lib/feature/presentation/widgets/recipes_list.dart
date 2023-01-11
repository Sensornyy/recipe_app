import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/feature/presentation/widgets/loading_indicator.dart';
import 'package:recipe_app/feature/presentation/widgets/recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        List<RecipeEntity> recipes = [];

        if (state is RecipesLoading) {
          return const LoadingIndicator();
        } else if (state is RecipesLoaded) {
          recipes = state.recipes;
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: recipes.length,
          itemBuilder: (BuildContext ctx, index) {
            return RecipeCard(recipes[index]);
          },
        );
      },
    );
  }
}
