import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          //does the same work as onChanged saves the user input
          controller: titleController,
          onSubmitted: (_) => submitData(),
          // onChanged: (val) {
          //   titleInput = val;
          // },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => submitData(),
          // onChanged: (val) {
          //   amountInput = val;
          // },
        ),
        FlatButton(
          child: Text('Add Transaction'),
          onPressed: submitData,
        )
      ]),
    );
  }
}
