import 'package:expense_tracker_app/widgets/add_expense.dart';
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

  _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) {
      return AddExpense(onAddExpense: _addExpense);
    });
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
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
