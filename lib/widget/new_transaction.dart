import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class new_transaction extends StatefulWidget {
   final Function  addTx;
   new_transaction(this.addTx);

  @override
  State<new_transaction> createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
   TextEditingController titleController = TextEditingController();
   TextEditingController amountControler = TextEditingController();
   late DateTime _selectDate=DateTime.now();

   void submitData(){

     final titleKey=titleController.text;
     final amountKey= double.parse( amountControler.text);
     setState(() {
       titleController.clear();
       amountControler.clear();
     });

     if(titleKey.isEmpty|| amountKey<=0 ){
         return;
     }
     widget.addTx(
         titleKey,
         amountKey,
         _selectDate

     );
     Navigator.of(context).pop(); //here our widget is pop before widget
   }

   void _presentDatePicker(){
     showDatePicker(
         context: context,
         initialDate:DateTime.now(),
         firstDate:DateTime(2023,1,1),
         lastDate:DateTime.now()
     ).then((value) {
         if(value==null){
           return;
         }
         setState(() {
           _selectDate=value;
         });

     });
   }

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
             // controller:  titleController,
             // onSubmitted: (_)=>submitData,
              onChanged: (val){
                setState(() {
                  titleController.text=val;
                });


              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              //controller: amountControler,
              keyboardType: TextInputType.number,
              //onSubmitted: (_)=>submitData(),
              onChanged: (value){
                setState(() {
                  amountControler.text=value;
                });

              },
            ),
             Container(
               height: 100,
               child: Row(
                   children: [
                      Padding(
                       padding: const EdgeInsets.only(left: 2),
                         child: Text(
                             _selectDate== DateTime.now()?'No date chosen!':
                             DateFormat.yMd().format(_selectDate))
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: ElevatedButton(
                           onPressed: _presentDatePicker,
                           child: const Text('Choose date')
                       ),
                     )
                   ],
                 ),

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
