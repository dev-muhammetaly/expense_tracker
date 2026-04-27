import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expanse_tracker/models/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    // category icons says that enumed value equal to the these icons
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 8),
                    Text(expense.date.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
