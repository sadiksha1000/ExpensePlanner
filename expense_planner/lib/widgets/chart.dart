import 'package:expense_planner/widgets/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final day = DateTime.now().subtract(Duration(days: index));
        var totalAmount = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == day.day &&
              recentTransactions[i].date.month == day.month &&
              recentTransactions[i].date.year == day.year) {
            totalAmount = recentTransactions[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(day).toString(),
          'amount': totalAmount
        };
      },
    );
  }

  double get totalSpentAmount {
    return groupedTransactions.fold(0.0, (previousValue, transaction) {
      return previousValue += transaction['amount'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((tx) {
              return ChartBar(
                day: tx['day'],
                amount: tx['amount'],
                totalSpentAmount: totalSpentAmount,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
