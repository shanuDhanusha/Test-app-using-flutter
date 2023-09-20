import 'package:flutter/material.dart';

class Chart_bar extends StatelessWidget {
  final String label;
  final String spendingAmount;
  final double spendingPctofTatal;
  Chart_bar(this.label,this.spendingAmount,this.spendingPctofTatal);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('\$${spendingAmount}'),
      const SizedBox(
        height: 4,
      ),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 10,
              decoration: BoxDecoration(
              border: Border.all( color: Colors.grey,width: 1),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(10)
            ),
             child: FractionallySizedBox(
               heightFactor: spendingPctofTatal,
               child: Container(
                 decoration: BoxDecoration(
                     color:Colors.amber,
                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
             ),
            )
          ],
        ),
      ),
      const SizedBox(height: 4,),
      Text(label,)
    ],);
  }
}
