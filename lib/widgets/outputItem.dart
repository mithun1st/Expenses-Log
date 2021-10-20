import 'package:flutter/material.dart';
import 'package:expenses_log/expensesModel.dart';

class OutputItem extends StatelessWidget {
  final Item i;
  OutputItem(this.i);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(
            radius: 22,
            child: FittedBox(
              child: Text(i.itemPrice.toString()),
            ),
          ),
          title: Text(i.itemName.toString()),
          subtitle: Text(i.purchaseDate.toString()),
        ),
      ),
    );
  }
}
