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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
