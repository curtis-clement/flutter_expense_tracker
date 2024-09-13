import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.model.dart';

class Expenses extends StatefulWidget {
  const Expenses({ super.key });

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(title: 'Food 1', amount: 14.99, date: DateTime.now(), category: Category.food),
    Expense(title: 'Food 2', amount: 19.99, date: DateTime.now(), category: Category.food),
    Expense(title: 'Travel 1', amount: 99.99, date: DateTime.now(), category: Category.travel),
    Expense(title: 'Leisure 1', amount: 49.99, date: DateTime.now(), category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(expensesList: _expenses),
          ),
        ],
      ),
    );
  }
}
