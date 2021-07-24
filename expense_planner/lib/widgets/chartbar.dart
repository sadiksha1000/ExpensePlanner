import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final day;
  final amount;
  final totalSpentAmount;

  ChartBar(
      {required this.day,
      required this.amount,
      required this.totalSpentAmount});

  double get percentageSpent {
    return amount / totalSpentAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rs.$amount"),
        Container(
          // padding: EdgeInsets.all(10),
          height: 120,
          // width: 40,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: FractionallySizedBox(
              heightFactor: percentageSpent,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      20,
                    )),
                height: 10,
                width: 20,
              ),
            ),
          ),
        ),
        Text("$day"),
      ],
    );
  }
}
