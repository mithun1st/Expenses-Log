import 'package:expenses_log/widgets/addItem.dart';
import 'package:expenses_log/widgets/emptyList.dart';
import 'package:expenses_log/widgets/weekChart.dart';
import 'package:flutter/material.dart';
import 'package:expenses_log/expensesModel.dart';
import 'widgets/outputItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //------------------------------Theme
      theme: ThemeData(
        accentColor: Colors.green,
        splashColor: Colors.purple,
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
  List<Item> _item = [
    Item(itemName: 'Earphone', itemPrice: 40.121, purchaseDate: DateTime.now()),
    Item(itemName: 'Shoe', itemPrice: 30.2, purchaseDate: DateTime.now()),
    Item(itemName: 'Earphone', itemPrice: 40.121, purchaseDate: DateTime.now()),
    Item(itemName: 'Food', itemPrice: 30.2, purchaseDate: DateTime.now()),
    Item(itemName: 'Phone', itemPrice: 60.121, purchaseDate: DateTime.now()),
    Item(itemName: 'Earphone', itemPrice: 40.121, purchaseDate: DateTime.now()),
  ];

  void addItem(String? name, double? price, DateTime? dt) {
    setState(() {
      _item.add(Item(itemName: name, itemPrice: price, purchaseDate: dt));
    });
  }

  void _itemDel(int? index) {
    setState(() {
      _item.removeAt(index!);
    });
    print(_item.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    //declare appbar variable
    final AppBar appBarVar = AppBar(
      title: Text(
        'Expenses Log',
        style: TextStyle(
          fontFamily: 'font3',
          fontSize: 24,
        ),
      ),
      leading: Icon(Icons.receipt),
      actions: [
        IconButton(
          onPressed: () {
            //setState(() {
            //_item.clear();
            //});

            //
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container();
                });
            //
          },
          icon: Icon(Icons.remove),
        ),
      ],
      backgroundColor: Colors.purple,
    );

    //screen size
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = appBarVar.preferredSize.height;

    return Scaffold(
      appBar: appBarVar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (screenHeight - (statusHeight + appBarHeight)) * .3,
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: WeekChart(_item),
              ),
            ),
            //
            Container(
              height: (screenHeight - (statusHeight + appBarHeight)) * .70,
              width: double.infinity,
              child: _item.isEmpty
                  ? EmptyList()
                  : OutputItem(_item.reversed.toList(), _itemDel),
            ),
          ],
        ),
      ),
      //--------------------------------Floating Action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return AddItem(addItem);
              });
        },
      ),
    );
  }
}
