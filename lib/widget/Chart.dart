import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/Chart_bar.dart';
import '../models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction>tarns;
  Chart(this.tarns);

  List<Map<String,Object>> get groupTransactionValue{
    return List.generate(7, (index) {
      final weekDay=DateTime.now().subtract(Duration(days: index));
      var totalSum=0.0;
      for(var i=0;i<tarns.length;i++){
         if(tarns[i].date.day==weekDay.day && tarns[i].date.month==weekDay.month
          && tarns[i].date.year==weekDay.year){
            totalSum+=tarns[i].amount;
         }
      }
      return {
        'day':DateFormat.E().format(weekDay).substring(0,1),
        'amount':totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending{
    return groupTransactionValue.fold(0.0, (previousValue, element){
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      margin: EdgeInsets.all(20),
      child: Container(
          padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValue.map((e){
             return Flexible(
               fit: FlexFit.loose,
               child: Chart_bar(
                   e['day'].toString(),
                   e['amount'].toString(),
                   maxSpending==0.0?00: ((e['amount']as double)/maxSpending)
               ),
             );
          }).toList(),
        ),
      ),
    );
  }
}
