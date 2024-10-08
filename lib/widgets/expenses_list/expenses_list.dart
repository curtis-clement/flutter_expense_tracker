import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList, required this.onRemoveExpense});

  final List<Expense> expensesList;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: const Color.fromARGB(255, 241, 76, 64),
              margin:  Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) {
              onRemoveExpense(expensesList[index]);
            },
            key: ValueKey(expensesList[index]),
            child: ExpenseItem(expense: expensesList[index]),
          );
        });
  }
}
