import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_game/game_over.dart';
import './home_page.dart';
import './options.dart';
import './game_over.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Game',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Simple Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isStart = false;
  bool isCorrectAnswer = true;
  int firstNum;
  int secondNum;
  int answer;

  int totalScore = 0;
  int totalTime = 5;

  Timer _timer;

  List<int> optionList;
  int answerPosition;

  var randomOptions;

  int generateRandomFalseOptions(List<int> _falseOptionsList) {
    int _randomFalseOptions = Random().nextInt(11) + Random().nextInt(11);

    if (_falseOptionsList.contains(_randomFalseOptions)) {
      _randomFalseOptions = generateRandomFalseOptions(_falseOptionsList);
    }
    return _randomFalseOptions;
  }

  void generateOptions() {
    firstNum = Random().nextInt(11);
    secondNum = Random().nextInt(11);
    answer = firstNum + secondNum;

    optionList = [0, 1, 2, 3];
    answerPosition = Random().nextInt(4);
    optionList.remove(answerPosition);

    List<int> _falseOptionsList = [answer];


    for (int i = 0; i < 3; i++) {
      int _falseRandomOption = generateRandomFalseOptions(_falseOptionsList);
      _falseOptionsList.add(_falseRandomOption);
    }
    randomOptions = {
      answerPosition: _falseOptionsList[0],
      optionList[0]: _falseOptionsList[1],
      optionList[1]: _falseOptionsList[2],
      optionList[2]: _falseOptionsList[3],
    };
  }

  void startGame() {
    generateOptions();
    setState(() {
      isStart = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          totalTime--;
        });
        if (totalTime <= 0) {
          setState(() {
            isCorrectAnswer = false;
          });
          _timer.cancel();
        }
      });
    });
  }

  void answerChoose(int _chosenAnswer) {
    if (_chosenAnswer == answer) {
      generateOptions();

      setState(() {
        totalTime = 5;
        totalScore++;

        //Toast
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: 'WoW Correct',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    } else {
      setState(() {
        isCorrectAnswer = false;

        //Toast
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: 'Oh No! You are Wrong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
      _timer.cancel();
    }
  }

  void resetGameHandler()
  {
    setState(() {
      totalScore = 0;
      isCorrectAnswer = true;
      isStart = true;
      totalTime = 5;
    });
    startGame();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: isCorrectAnswer
            ? (isStart
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Colors.blueGrey,
                              elevation: 5,
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                width: 70.0,
                                child: Text(
                                  '${totalTime}s',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Bangers',
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '$firstNum + $secondNum',
                              style: TextStyle(
                                fontFamily: 'Bangers',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              elevation: 5,
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                width: 70.0,
                                child: Text(
                                  '$totalScore',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Bangers',
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Options(randomOptions, answerChoose),
                    ],
                  )
                : HomePage(startGame))
            : FinalPage(totalScore, resetGameHandler),
    );
  }
}
