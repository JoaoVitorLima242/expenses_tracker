import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
  });

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Text(expensesList[index].title),
    );
  }
}
