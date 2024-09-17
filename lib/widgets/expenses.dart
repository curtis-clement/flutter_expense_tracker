import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/add_expense.dart';
import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
        title: 'Food 1',
        amount: 14.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Food 2',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Travel 1',
        amount: 99.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Leisure 1',
        amount: 49.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return AddExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('Removed expense: ${expense.title}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget bodyContent = const Center(
      child:
          Text('You have no current expenses. Add some with the "+" button!'),
    );

    if (_expenses.isNotEmpty) {
      bodyContent = ExpensesList(
        expensesList: _expenses, onRemoveExpense: _removeExpense);
    }

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
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _expenses),
          Expanded(
            child: bodyContent,
          ),
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _expenses)),
          Expanded(child: bodyContent),
        ],
      ),
    );
  }
}
