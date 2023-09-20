import 'package:flutter/material.dart';
import './widget/Chart.dart';
import './models/Transaction.dart';
import './widget/new_transaction.dart';
import './widget/user_tarnsaction.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //fontFamily: 'OpenSans',
      ),
      home:  MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction>_userTransaction=[
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title:'chose',
    //     amount:33,
    //     date:DateTime.now()
    // )
  ];

    List<Transaction> get _recentTransaction{
      return _userTransaction.where((element){
         return element.date.isAfter(DateTime.now().subtract( const Duration(days: 7),));
      }).toList();
    }

  void _addNewTransaction(String Txtitle,double Txamount,DateTime dat){
    final newTx=Transaction(
        id: DateTime.now().toString(),
        title: Txtitle,
        amount: Txamount,
        date:dat
    );
    setState(() {
      _userTransaction.add(newTx);
    });

  }



   void _startNewTransction(BuildContext ctx){
      showModalBottomSheet(
          context: ctx,
          builder: (_){
            return new_transaction(_addNewTransaction);
          }
      );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title:const Text(
            'Money Mange',
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
          actions: const [
            IconButton(
                onPressed: null,
                icon:Icon(Icons.add)
            )
          ],
          leading:const Icon(Icons.account_balance,size: 20,color: Colors.white,),
        ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
           Chart(_recentTransaction),
            user_tarnsaction(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          _startNewTransction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}




