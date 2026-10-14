class CategoryModel {
  final String name;
  final String emoji;
  final bool isSeeAll;

  const CategoryModel({
    required this.name,
    this.emoji = '',
    this.isSeeAll = false,
  });
}
