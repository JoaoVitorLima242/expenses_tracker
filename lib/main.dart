import 'package:expenses_tracker/screens/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const ExpensesScreen(),
  ));
}
