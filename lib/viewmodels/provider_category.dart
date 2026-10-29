import 'package:flutter/material.dart';

import '../models/model_category.dart';

class CategoryProvider extends ChangeNotifier {
  // hardcoded categories
  final List<ModelCategory> _categories = [
    ModelCategory(
      id: 'category_1',
      name: 'Food',
      description: 'Restaurants or food delivery expenses',
      icon: Icons.fastfood,
      color: Colors.orange,
    ),
    ModelCategory(
      id: 'category_2',
      name: 'Transport',
      description: 'Gas or PT expenses',
      icon: Icons.directions_car,
      color: Colors.blue,
    ),
  ];

  //
  List<ModelCategory> get categories => _categories;

  void addCategory(ModelCategory category) {
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(ModelCategory updatedCategory) {
    final index = _categories.indexWhere((cat) => cat.id == updatedCategory.id);
    if (index != -1) {
      _categories[index] = updatedCategory;
      notifyListeners();
    }
  }

  void removeCategory(String id) {
    _categories.removeWhere((cat) => cat.id == id);
    notifyListeners();
  }

  ModelCategory? getCategoryById(String id) {
    return _categories.where((cat) => cat.id == id).firstOrNull;
  }
}
