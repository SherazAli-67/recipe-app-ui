class RecipeModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String cookTime;
  final String category;
  final double rating;
  final String difficulty;
  final List<String> ingredients;
  final String directions;
  bool isFavorite;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.cookTime,
    required this.category,
    required this.rating,
    required this.difficulty,
    required this.ingredients,
    required this.directions,
    this.isFavorite = false,
  });
}
