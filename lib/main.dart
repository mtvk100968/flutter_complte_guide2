import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1', 
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now(),
      ),

      Transaction(
      id: 't2', 
      title: 'Weekley Grocerires',
      amount: 299.99,
      date: DateTime.now(),
      ),

      Transaction(
      id: 't3', 
      title: 'Weekend Party',
      amount: 199.99,
      date: DateTime.now(),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluuter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text('CHART!', style: TextStyle(
                          fontSize: 50, 
                          fontWeight: FontWeight.bold,
                          ),),
          elevation: 50,
            ),
          ),


           Column(
            children: transactions.map((tx){
             return Card(
               child: Row(
                children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple, 
                          width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple, 
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        tx.title, 
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey
                          ),
                        
                      ),
                      //  ),
                      ],
                    ),
                  ],
               ),

             );
         }).toList(),
         ),
       ],
      ),
     );
  }
}