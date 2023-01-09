import 'package:flutter/material.dart';

import '../widgets/recipes_list.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recipe App'),
      ),
      body: const RecipesList()
    );
  }
}
