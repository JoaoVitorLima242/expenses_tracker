import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

List<Expense> dummyExpenses = [
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
