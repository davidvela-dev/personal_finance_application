import 'package:flutter/material.dart';

import '../models/model_category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _categories = []; // list to storage new categories

  // getter for widgets to obtain categories
  List<Category> get categories => _categories;

  // receive new category and update widgets
  void addCategory(Category category) {
    _categories.add(category); // add category to list
    notifyListeners();
  }

  // receive new data from category
  void updateCategory(Category updatedCategory) {
    final index = _categories.indexWhere(
      (cat) => cat.id == updatedCategory.id,
    ); // found index of category
    if (index != -1) {
      // if id was found
      _categories[index] =
          updatedCategory; // change old category with new one with updated data
      notifyListeners(); // update widgets
    }
  }

  // remove category
  void removeCategory(String id) {
    _categories.removeWhere(
      (cat) => cat.id == id,
    ); // found category by id and delete
    notifyListeners();
  }
}
