import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int selectedCategoryIndex = 1;

  void selectCategory(int index) {
    if (selectedCategoryIndex == index) return;
    selectedCategoryIndex = index;
    notifyListeners();
  }
}
