import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';


class Tarnsaction_list extends StatelessWidget {
   final List<Transaction>transaction;
   Tarnsaction_list(this.transaction);

  @override
  Widget build(BuildContext context) {
    return  Container(
           height: 300,
        child: ListView.builder(
          itemBuilder: (ctx,index){
               return Card(
                 margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                 elevation: 5,
                 child: ListTile(
                      leading:CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        radius: 30,
                        child: Padding(
                             padding: EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text("\$${transaction[index].amount}")
                          ),
                        ),
                      ) ,
                   title: Text(
                       "${transaction[index].title}"
                   ),
                   subtitle: Text( DateFormat.yMMMd().format( transaction[index].date)),
                 ),
               );

          },
          itemCount: transaction.length,
        ),

    );
  }
}
