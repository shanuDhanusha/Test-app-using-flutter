import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';


class Tarnsaction_list extends StatefulWidget {
   final List<Transaction>transaction;
   Tarnsaction_list(this.transaction);

  @override
  State<Tarnsaction_list> createState() => _Tarnsaction_listState();
}

class _Tarnsaction_listState extends State<Tarnsaction_list> {
  @override
  Widget build(BuildContext context) {
    print("myyyyy${widget.transaction}");
    return  Container(
           height: 400,
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
                             padding: const EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text("\$${widget.transaction[index].amount}")
                          ),
                        ),
                      ) ,
                   title: Text(
                       widget.transaction[index].title
                   ),
                   subtitle: Text( DateFormat.yMMMd().format( widget.transaction[index].date)),
                   trailing:  IconButton(
                       icon: const Icon(Icons.delete,color: Colors.green,),
                        onPressed:(){
                            setState(() {
                               widget.transaction.removeAt(index);
                            });
                        },
                   ),

                 ),
               );
             },
          itemCount:widget.transaction.length,

        ),

    );
  }
}
