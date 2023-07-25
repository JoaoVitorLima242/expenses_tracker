import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.access_alarm),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(expense.date.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
