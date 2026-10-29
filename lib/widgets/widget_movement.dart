import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_movement.dart';
import '../viewmodels/provider_category.dart';

class WidgetMovement extends StatelessWidget {
  // widget
  final List<ModelMovement> items; // variable for instance of list of movements

  const WidgetMovement({
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
            'No Recent Movements',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      // constructor to build movement item
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      itemCount: items.length,
      // function executed per index to build each item of widget
      itemBuilder: (context, index) {
        return MovementItem(movement: items[index]);
      },
    );
  }
}

class MovementItem extends StatelessWidget {
  // widget item
  final ModelMovement movement; // variable for item movement

  const MovementItem({
    super.key,
    required this.movement,
  }); // constructor of item

  @override
  Widget build(BuildContext context) {
    // method for specifications of item
    final category =
        Provider.of<CategoryProvider>(
              context,
            ) // get category by id from the provider
            .getCategoryById(movement.categoryId);

    return ListTile(
      // return item formatted
      leading: Icon(
        category?.icon ?? Icons.square_rounded,
        color: category?.color ?? Colors.grey,
        size: 20,
      ),
      title: Text(
        movement.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        '${category?.name ?? 'No Category'} · ${movement.date.day}/${movement.date.month}',
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      trailing: Text(
        movement.amount.startsWith('-')
            ? '-\$${movement.amount.substring(1)}'
            : '+\$${movement.amount.replaceAll('+', '')}',
        style: TextStyle(
          color: movement.amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
