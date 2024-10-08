import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.airplanemode_active,
  Category.leisure: Icons.sports_tennis,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  
  String get formattedDate => formatter.format(date);  
  IconData get icon => categoryIcons[category]!;
}

class ExpenseGroup {
  ExpenseGroup({
    required this.category,
    required this.expenses,
  });

  ExpenseGroup.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}