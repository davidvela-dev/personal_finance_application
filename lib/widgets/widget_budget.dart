import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_budget.dart';
import '../viewmodels/provider_category.dart';

class WidgetBudget extends StatelessWidget {
  // widget
  final List<ModelBudget> budgets; // variable for instance of list of budgets

  final Function(ModelBudget)?
  onEditBudget; // callback function to receive budget model to edit

  const WidgetBudget({
    super.key,
    required this.budgets,
    this.onEditBudget,
  }); // constructor of widget

  @override
  Widget build(BuildContext context) {
    // method to build widget
    if (budgets.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No Budgets Registered',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      // constructor to build budget item
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      itemCount: budgets.length,
      // function executed per index to build each item of widget
      itemBuilder: (context, index) {
        final budget = budgets[index];
        return BudgetItem(
          budget: budget,
          onEdit: () => onEditBudget?.call(
            budget,
          ), // function edit to send budget on current index
        );
      },
    );
  }
}

class BudgetItem extends StatelessWidget {
  // widget item
  final ModelBudget budget; // variable for item budget

  final VoidCallback? onEdit; // variable for callback function

  const BudgetItem({
    super.key,
    required this.budget,
    this.onEdit,
  }); // constructor of item

  @override
  Widget build(BuildContext context) {
    // method for specifications of item
    final category =
        Provider.of<CategoryProvider>(
              context,
            ) // get category by id from the provider
            .getCategoryById(budget.categoryId);

    final double progress = (budget.usedAmount / budget.limitAmount).clamp(
      0.0,
      1.0,
    ); // amounts
    final int percentage = (progress * 100).toInt(); // usage percentage
    final double available =
        budget.limitAmount - budget.usedAmount; // available amount

    return ListTile(
      // return item formatted
      leading: Icon(
        category?.icon ?? Icons.category,
        color: category?.color ?? Colors.blue,
        size: 20,
      ),
      title: Text(
        category?.name ?? budget.categoryId,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$${budget.usedAmount.toStringAsFixed(2)} / \$${budget.limitAmount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.grey,
              color: category?.color ?? Colors.blue,
            ),
          ),

          Text(
            '$percentage% used / available \$${available.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit_outlined, size: 18),
        onPressed: onEdit,
      ),
    );
  }
}
