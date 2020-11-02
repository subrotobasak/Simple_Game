import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final Function _startGame;

  HomePage(this._startGame);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            height: 200,
            child: Image.asset('images/welcome.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Welcome to Simple Game ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bangers',
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: GestureDetector(
              child: Icon(
                Icons.play_circle_outline,
                size: 130.0,
                color: Colors.amber,
              ),
              onTap: _startGame,
            ),
          )
        ],
      ),
    );
  }
}
