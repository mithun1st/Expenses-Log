import 'package:flutter/material.dart';
import 'package:expenses_log/expensesModel.dart';
import 'package:date_time_format/date_time_format.dart';

class OutputItem extends StatelessWidget {
  final List<Item> i;
  Function? removeItem;
  OutputItem(this.i, this.removeItem);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 4,
          child: Text(
            'Number of Item: ${i.length}',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: ListView.builder(
            itemCount: i.length,
            reverse: false,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, position) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade400,
                      radius: 27,
                      child: FittedBox(
                        child: Text(
                          '\$${i[position].itemPrice}',
                          style: TextStyle(
                            fontFamily: 'font2',
                            color: Colors.deepPurple.shade900,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      i[position].itemName.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'font1',
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(
                      i[position].purchaseDate!.format('l, d M Y'),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 24,
                      ),
                      onPressed: () => removeItem!(position),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
