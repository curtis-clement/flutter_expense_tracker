import 'package:flutter/material.dart';

import './newTransaction.dart';
import './transactionList.dart';

import '../modles//transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'a1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'a2',
      title: 'Groceries',
      amount: 24.95,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TrasanctionList(_userTransactions),
      ],
    );
  }
}
