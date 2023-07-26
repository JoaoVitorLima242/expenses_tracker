import 'package:flutter/material.dart';

class NewExpensesBottomSheet extends StatefulWidget {
  const NewExpensesBottomSheet({super.key});

  @override
  State<NewExpensesBottomSheet> createState() {
    return _NewExpensesBottomSheet();
  }
}

class _NewExpensesBottomSheet extends State<NewExpensesBottomSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onSaveExpense() {
    print(_titleController.text);
    print(_amountController.text);
  }

  void _onSelectDate() {
    final now = DateTime.now();
    final firstTime = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstTime,
      lastDate: now,
    );
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  const Text('Select a date'),
                  IconButton(
                      onPressed: _onSelectDate,
                      icon: const Icon(
                        Icons.calendar_month,
                      ))
                ],
              ),
            )
          ]),
          Row(
            children: [
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
