import 'package:expenses_tracker/custom_widgets/expense_card.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});

  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;

  void _onExpenseDismissed(
    DismissDirection direction,
    Expense expense,
  ) {
    onRemoveExpense(expense);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expensesList[index].id),
        onDismissed: (direction) =>
            _onExpenseDismissed(direction, expensesList[index]),
        child: ExpensesCard(
          expense: expensesList[index],
        ),
      ),
    );
  }
}
