import 'package:expenses_tracker/custom_widgets/error_dialog.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpensesBottomSheet extends StatefulWidget {
  const NewExpensesBottomSheet({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpensesBottomSheet> createState() {
    return _NewExpensesBottomSheet();
  }
}

class _NewExpensesBottomSheet extends State<NewExpensesBottomSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onSaveExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    final isDataInvalid = _selectedDate == null;
    final isTitleInvalid = _titleController.text.trim().isEmpty;

    if (isTitleInvalid || isAmountInvalid || isDataInvalid) {
      showDialog(
        context: context,
        builder: (context) => const ErrorDialog(),
      );

      return;
    }

    widget.onAddExpense(
      Expense(
        amount: enteredAmount,
        title: _titleController.text,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
  }

  void _onSelectDate() async {
    final now = DateTime.now();
    final firstTime = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstTime,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onSelectCategory(Category? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _selectedCategory = value;
    });
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dropdownList = Category.values
        .map(
          (category) => DropdownMenuItem(
            value: category,
            child: Text(category.name.toUpperCase()),
          ),
        )
        .toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'Select a date'
                      : dateFormatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _onSelectDate,
                      icon: const Icon(
                        Icons.calendar_month,
                      ))
                ],
              ),
            )
          ]),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                items: dropdownList,
                value: _selectedCategory,
                onChanged: _onSelectCategory,
              ),
              const Spacer(),
              TextButton(onPressed: _onCancel, child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _onSaveExpense,
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
