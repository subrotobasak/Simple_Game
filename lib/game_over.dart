import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  final int _totalResult;
  final Function _resetGame;

  FinalPage(this._totalResult, this._resetGame);

  @override
  Widget build(BuildContext context) {
    String resultImage =
        _totalResult >= 15 ? 'great' : 'bad';
    return Container(
      padding: const EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'images/$resultImage.png',
              height: 200,
              width: 200,
            ),
          ),

          //Other

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'GAME OVER',
                    style: TextStyle(
                      fontFamily: 'Bangers',
                      fontSize: 50,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: 7.0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '$_totalResult',
                      style: TextStyle(
                        fontFamily: 'Bangers',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.white,
                    //     width: 2.0,
                    //   ),
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    child: RaisedButton(
                      child: Text(
                        'RESTART',
                        style: TextStyle(
                          fontFamily: 'Bangers',
                          fontSize: 40,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blueGrey,
                      onPressed: _resetGame,
                      elevation: 5,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
