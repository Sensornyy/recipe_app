import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipe_app/common/colors/app_colors.dart';
import 'package:recipe_app/feature/presentation/bloc/recipes_bloc.dart';
import 'package:recipe_app/feature/presentation/screens/recipe_screen.dart';
import 'package:recipe_app/service_locator.dart' as di;
import 'package:recipe_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipesBloc>(
      create: (context) => sl<RecipesBloc>()..add(const SearchRecipesEvent('salad')),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor
        ),
          home: const RecipeScreen()
      ),
    );
  }
}
