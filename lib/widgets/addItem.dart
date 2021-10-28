import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

class AddItem extends StatefulWidget {
  final Function add;
  AddItem(this.add);

  @override
  State createState() {
    return _AddItemState();
  }
}

class _AddItemState extends State<AddItem> {
  DateTime? dt = DateTime.now();
  TextEditingController? name = TextEditingController();
  TextEditingController? price = TextEditingController();

  datePick() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 2),
    ).then((value) {
      setState(() {
        dt = value;
      });
    });
  }

  void submit() {
    if (name!.text.isEmpty || price!.text.isEmpty || dt == null) {
      return;
    }
    widget.add(name!.text, double.parse(price!.text), dt);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                labelText: 'Name',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                hintText: 'Type Name . . .',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.money),
                labelText: 'Price',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                hintText: 'Enter Amount . . .',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => datePick(),
                  child: Text('Pick Date'),
                ),
                Text(dt!.format('l, d F Y')),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => submit(),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
