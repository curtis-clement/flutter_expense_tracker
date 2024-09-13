import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({ super.key, required this.expensesList });

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expensesList.length, itemBuilder: (context, index) {
      return Text(expensesList[index].title);
    });
  }
}