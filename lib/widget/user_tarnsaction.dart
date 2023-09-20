import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'Tarnsaction_list.dart';
import 'new_transaction.dart';


class user_tarnsaction extends StatefulWidget {
  final List<Transaction>transaction;
   user_tarnsaction(this.transaction);

  @override
  State<user_tarnsaction> createState() => _user_tarnsactionState();
}

class _user_tarnsactionState extends State<user_tarnsaction> {
  //      Transaction(
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //new_transaction(_addNewTransaction),
        Tarnsaction_list(widget.transaction)

      ],
    );
  }
}
