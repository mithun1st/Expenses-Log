import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/emptytrash.png',
            fit: BoxFit.contain,
          ),
          SizedBox(height: 25),
          Text(
            'List is Empty !',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
