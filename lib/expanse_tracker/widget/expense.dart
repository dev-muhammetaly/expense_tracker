import 'package:expense_tracker_app/expanse_tracker/models/expenses.dart';
import 'package:expense_tracker_app/expanse_tracker/widget/expenses-list/expenseList.dart';
import 'package:expense_tracker_app/expanse_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expense> {
  final List<Expenses> _registeredExpenses = [
    Expenses(
      title: "Flutter course",
      amount: 99,
      date: DateTime.now(),
      category: Category.Work,
    ),
    Expenses(
      title: "Movie",
      amount: 20,
      date: DateTime.now(),
      category: Category.Leisure,
    ),
    Expenses(
      title: "AlShamiah",
      amount: 15,
      date: DateTime.now(),
      category: Category.Taxi,
    ),
    Expenses(
      title: "Mee Tarik",
      amount: 15.7,
      date: DateTime.now(),
      category: Category.Food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: (Expenses expense) {
          _addExpense(expense);
        },
      ),
    );
  }

  void _addExpense(Expenses expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expenses expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text("No Expenses Found. Start adding some! "),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expenselist(
        expenses: _registeredExpenses,
        onRemoveExpense: (Expenses expense) {
          _removeExpense(expense);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Flutter ExpenseTracker",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Text("The chart"),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Text("The chart"),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
