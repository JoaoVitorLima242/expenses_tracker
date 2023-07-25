import 'package:expenses_tracker/custom_widgets/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpenseScreen();
  }
}

class _ExpenseScreen extends State<ExpensesScreen> {
  void onAddExpense() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onAddExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Dash'),
          Expanded(
            child: ExpensesList(expensesList: dummyExpenses),
          ),
        ],
      ),
    );
  }
}
