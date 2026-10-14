import 'package:flutter/foundation.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_data.dart';

class FavoritesProvider extends ChangeNotifier {
  String expandedCategory = StringConst.salad;

  void toggleCategory(String category) {
    expandedCategory = expandedCategory == category ? '' : category;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final recipe = AppData.recipeById(id);
    if (recipe == null) return;
    recipe.isFavorite = !recipe.isFavorite;
    notifyListeners();
  }

  bool isExpanded(String category) => expandedCategory == category;
}
