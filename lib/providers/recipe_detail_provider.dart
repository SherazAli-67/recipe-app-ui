import 'package:flutter/foundation.dart';

class RecipeDetailProvider extends ChangeNotifier {
  bool isDescriptionExpanded = false;
  bool isIngredientsExpanded = false;
  bool isDirectionsExpanded = true;

  void toggleDescription() {
    isDescriptionExpanded = !isDescriptionExpanded;
    notifyListeners();
  }

  void toggleIngredients() {
    isIngredientsExpanded = !isIngredientsExpanded;
    notifyListeners();
  }

  void toggleDirections() {
    isDirectionsExpanded = !isDirectionsExpanded;
    notifyListeners();
  }
}
