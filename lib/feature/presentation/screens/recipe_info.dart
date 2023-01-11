import 'package:flutter/material.dart';
import 'package:recipe_app/feature/domain/entities/recipe_entity.dart';
import 'package:recipe_app/feature/presentation/widgets/recipe_cache_image.dart';

class RecipeInfo extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeInfo(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          recipe.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: recipe.image,
              child: RecipeCacheImage(recipe.image,
                  width: double.infinity, height: 400),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemBuilder: (context, index) => Text(
                  recipe.ingredientLines[index],
                  style: const TextStyle(fontSize: 18),
                ),
                itemCount: recipe.ingredientLines.length,
              ),
            ),
            Row(
              children: [
                Text(
                  '${recipe.calories} Kcal',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
