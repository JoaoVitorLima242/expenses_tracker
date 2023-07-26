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

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onSaveExpense() {
    print(_titleController.text);
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
          Row(
            children: [
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
