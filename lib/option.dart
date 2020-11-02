import 'package:flutter/material.dart';
class Option extends StatelessWidget {
  final int optionValue;
  final Function answerChosenHandler;

  Option(this.optionValue, this.answerChosenHandler);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => answerChosenHandler(optionValue),
      child: Card(
        color: Colors.blueGrey,
        elevation: 5,
        child: Center(
          child: Text('$optionValue',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )),
        ),
      ),
    );
  }
}
