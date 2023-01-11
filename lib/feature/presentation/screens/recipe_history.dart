import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/feature/presentation/widgets/recipes_list.dart';

class RecipeHistory extends StatelessWidget {
  const RecipeHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecipesBloc>(context)
        .add(const GetRecipesEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Recipe App'),
        centerTitle: true,
      ),
      body: const RecipesList()
    );
  }
}
