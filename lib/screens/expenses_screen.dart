import 'package:expenses_tracker/custom_widgets/expenses_list.dart';
import 'package:expenses_tracker/custom_widgets/new_expense_bottom_sheet.dart';
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
  final List<Expense> _registeredExpenses = [];

  void onAddExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });

    Navigator.pop(context);
  }

  void _onRemoveExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _onUndoRemovedExpense(expense, expenseIndex),
        ),
        content: const Text('Expense deleted!'),
      ),
    );
  }

  void _onUndoRemovedExpense(Expense expense, int index) {
    setState(() {
      _registeredExpenses.insert(index, expense);
    });
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpensesBottomSheet(
        onAddExpense: onAddExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Dash'),
          Expanded(
            child: ExpensesList(
              expensesList: _registeredExpenses,
              onRemoveExpense: _onRemoveExpense,
            ),
          )
        ],
      ),
    );
  }
}
