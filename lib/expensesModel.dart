import 'package:flutter/material.dart';

class Item {
  String? itemName;
  double? itemPrice;
  DateTime? purchaseDate;
  Item(
      {@required this.itemName,
      @required this.itemPrice,
      @required this.purchaseDate});
}
