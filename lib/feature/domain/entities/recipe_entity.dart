import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String title;
  final int calories;
  final String thumbnail;
  final String image;
  final List<String> ingredients;

  const RecipeEntity({
    required this.title,
    required this.calories,
    required this.thumbnail,
    required this.image,
    required this.ingredients,
  });

  @override
  List<Object> get props => [
        title,
        calories,
        thumbnail,
        image,
        ingredients,
      ];
}
