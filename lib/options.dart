import 'package:flutter/material.dart';
import './option.dart';

class Options extends StatelessWidget {
  final _randomOptions;
  final Function _answerChosenHandler;

  Options(this._randomOptions, this._answerChosenHandler);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
       Option(_randomOptions[0], _answerChosenHandler),
       Option(_randomOptions[1], _answerChosenHandler),
       Option(_randomOptions[2], _answerChosenHandler),
       Option(_randomOptions[3], _answerChosenHandler)
      ],
    );
  }
}
