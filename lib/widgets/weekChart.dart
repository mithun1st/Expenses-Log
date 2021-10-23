import 'package:expenses_log/expensesModel.dart';
import 'package:flutter/material.dart';

class WeekChart extends StatelessWidget {
  final List<Item> i;
  WeekChart(this.i) {
    i.forEach((e) {
      switch (e.purchaseDate!.weekday) {
        case 6:
          week!['sat'] = week!['sat']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 7:
          week!['sun'] = week!['sun']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 1:
          week!['mon'] = week!['mon']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 2:
          week!['tue'] = week!['tue']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 3:
          week!['wed'] = week!['wed']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 4:
          week!['thu'] = week!['thu']!.toDouble() + (e.itemPrice!.toDouble());
          break;
        case 5:
          week!['fri'] = week!['fri']!.toDouble() + (e.itemPrice!.toDouble());
          break;
      }
    });
  }

  Map<String, double>? week = {
    'sat': 0,
    'sun': 0,
    'mon': 0,
    'tue': 0,
    'wed': 0,
    'thu': 0,
    'fri': 0,
  };

  double get amount {
    double? sum = 0;
    i.forEach((element) {
      sum = sum! + element.itemPrice!;
    });
    return sum!;
  }

  Widget chart(double per, double tot, String wek) {
    return Card(
      elevation: 8,
      child: Container(
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              child: Text('\$${per.toStringAsFixed(2)}'),
            ),
            Container(
              height: 100,
              width: 14,
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: FractionallySizedBox(
                heightFactor: (per / tot) > 0 ? (per / tot) : 0,
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            Text(
              wek.toUpperCase(),
              style: TextStyle(
                color: Colors.teal.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: week!.keys.map((e) {
            return chart(week![e]!.toDouble(), amount, e);
          }).toList(),
        ),
        Text(
          'Total Cost: \$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.red.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
