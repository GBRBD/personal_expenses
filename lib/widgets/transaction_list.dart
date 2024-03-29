import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final emptyList = LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    });

    return Container(
      child: transactions.isEmpty
          ? emptyList
          : ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx))
                  .toList()),
    );
  }
}
