import 'package:flutter/material.dart';

import '../models/model_category.dart';

class WidgetCategory extends StatelessWidget {
  // widget
  final List<ModelCategory>
  items; // variable for instance of list of categories

  const WidgetCategory({
    super.key,
    required this.items,
  }); // constructor of widget

  @override
  Widget build(BuildContext context) {
    // method to build widget
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No Categories',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      // constructor to build category item
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      itemCount: items.length,
      // function executed per index to build each item of widget
      itemBuilder: (context, index) {
        return CategoryItem(category: items[index]);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  // widget item
  final ModelCategory category; // variable for item category

  const CategoryItem({
    super.key,
    required this.category,
  }); // constructor of item

  @override
  Widget build(BuildContext context) {
    // method for specifications of item

    return ListTile(
      // return item formatted
      leading: Icon(category.icon, color: category.color, size: 20),
      title: Text(
        category.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        category.description,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}
