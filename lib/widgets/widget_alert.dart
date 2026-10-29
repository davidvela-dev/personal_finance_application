import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_alert.dart';
import '../viewmodels/provider_category.dart';

class WidgetAlert extends StatelessWidget {
  // widget
  final List<ModelAlert> items; // variable for instance of list of alerts

  const WidgetAlert({super.key, required this.items}); // constructor of widget

  @override
  Widget build(BuildContext context) {
    // method to build widget
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No Alerts',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      // constructor to build alert item
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      itemCount: items.length,
      itemBuilder: (context, index) {
        // function executed per index to build each item of widget
        return AlertItem(alert: items[index]);
      },
    );
  }
}

class AlertItem extends StatelessWidget {
  // widget item
  final ModelAlert alert; // variable for item alert

  const AlertItem({super.key, required this.alert}); // constructor of item

  @override
  Widget build(BuildContext context) {
    // method for specifications of item
    final category =
        Provider.of<CategoryProvider>(
              context,
            ) // get category by id from the provider
            .getCategoryById(alert.categoryId);

    return ListTile(
      // return item formatted
      leading: Icon(
        category?.icon ?? Icons.warning_amber_rounded,
        color: category?.color ?? Colors.grey,
        size: 20,
      ),
      title: Text(
        alert.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        alert.description,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      trailing: const Icon(Icons.circle_rounded, color: Colors.green, size: 10),
    );
  }
}
