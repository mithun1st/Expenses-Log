import 'package:flutter/material.dart';
import 'package:expenses_log/expensesModel.dart';
import 'widgets/outputItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //-----------------
      theme: ThemeData(
        splashColor: Colors.red,
        accentColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  List<Item>? _item = [
    Item(itemName: 'Shoe', itemPrice: 32.2, purchaseDate: DateTime.now()),
    Item(
        itemName: 'Phone', itemPrice: 1044.12145, purchaseDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Log'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Theme.of(context).splashColor,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              //color: Theme.of(context).accentColor,
              child: ListView.builder(
                itemCount: _item!.length,
                itemBuilder: (_, i) {
                  return OutputItem(_item![i]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
