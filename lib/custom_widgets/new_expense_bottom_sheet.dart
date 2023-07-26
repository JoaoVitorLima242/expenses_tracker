import 'package:flutter/material.dart';

class NewExpensesBottomSheet extends StatefulWidget {
  const NewExpensesBottomSheet({super.key});

  @override
  State<NewExpensesBottomSheet> createState() {
    return _NewExpensesBottomSheet();
  }
}

class _NewExpensesBottomSheet extends State<NewExpensesBottomSheet> {
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  void _onSaveExpense() {
    print(_enteredTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
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
