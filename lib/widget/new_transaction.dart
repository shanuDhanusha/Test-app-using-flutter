import 'package:flutter/material.dart';

class new_transaction extends StatefulWidget {
   final Function  addTx;
   new_transaction(this.addTx);

  @override
  State<new_transaction> createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
   TextEditingController titleController = TextEditingController();

   TextEditingController amountControler = TextEditingController();

   void submitData(){

     final titleKey=titleController.text;
     final amountKey= double.parse( amountControler.text);
    // print("titiefndkndkhgjkdgjk${titleController.text}");
     setState(() {
       titleController.clear();
       amountControler.clear();
     });

     if(titleKey.isEmpty|| amountKey<=0){
         return;
     }
     widget.addTx(
         titleKey,
         amountKey
       // titleController.text,
       // amountControler.text
     );
     Navigator.of(context).pop(); //herer our widget is pop befor widget

   }

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
             // controller:  titleController,
             // onSubmitted: (_)=>submitData,
              onChanged: (val){
                titleController.text=val;

              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              //controller: amountControler,
              keyboardType: TextInputType.number,
              //onSubmitted: (_)=>submitData(),
              onChanged: (value){
                amountControler.text=value;
              },
            ),
             ElevatedButton(
              onPressed:submitData,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)
              ),
              child:const Text('Add Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
