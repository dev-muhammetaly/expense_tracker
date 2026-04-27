import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expanse_tracker/models/expenses.dart';
import 'package:expense_tracker_app/expanse_tracker/widget/expenses-list/expense_item.dart';

class Expenselist extends StatelessWidget {
  const Expenselist({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expenses> expenses;
  final void Function(Expenses expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}
