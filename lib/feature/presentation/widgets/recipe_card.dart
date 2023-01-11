import 'package:flutter/material.dart';
import 'package:recipe_app/common/colors/app_colors.dart';
import 'package:recipe_app/feature/presentation/widgets/recipe_cache_image.dart';

import '../../domain/entities/recipe_entity.dart';
import '../screens/recipe_info.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeCard(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeInfo(recipe)));
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cardColor),
          child: SizedBox(
            child: Column(
              children: [
                Hero(
                  tag: recipe.image,
                  child: RecipeCacheImage(
                    recipe.image,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    recipe.label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('${recipe.calories} Kcal'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
