import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpenseScreen();
  }
}

class _ExpenseScreen extends State<ExpensesScreen> {
  final List<Expense> expenses = [
    Expense(
      amount: 19.99,
      title: 'Flutter Course',
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      amount: 499.99,
      title: 'Go to Peru',
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      amount: 49.99,
      title: 'Cripto Course',
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Dash'),
          Text('expenses'),
        ],
      ),
    );
  }
}
