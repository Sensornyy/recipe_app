import 'package:flutter/material.dart';
import 'package:recipe_app/feature/presentation/widgets/recipe_search_delegate.dart';

import '../widgets/recipes_list.dart';
import 'recipe_history.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text('Recipe App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeHistory(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: RecipeSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: const RecipesList());
  }
}
