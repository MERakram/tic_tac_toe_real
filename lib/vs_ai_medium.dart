import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'difficulty_screen.dart';
import 'game_button.dart';

class vs_ai_medium extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<vs_ai_medium> {

  late Color color;
  late double x;
  double k = 0;
  double l = 0;
  late double y = 10.7;
  late var axis;
  double rAngle = 0;
  late double lineLength;
  late var rAlign;
  var player1 = [];
  var player2 = [];
  String gamestr = '';

  late bool gameisdone;

  List listButton = <GameButton>[
    new GameButton(1),
    new GameButton(2),
    new GameButton(3),
    new GameButton(4),
    new GameButton(5),
    new GameButton(6),
    new GameButton(7),
    new GameButton(8),
    new GameButton(9)
  ];
  int I1 = 0;
  int I2 = 0;
  void playsound(String name) {
    final player = AudioCache();
    player.play('$name.wav');
  }

  Future<void> waitpop() {
    return Future.delayed(
        const Duration(seconds: 1),
            () => setState(() {
          createAlertDialog(context);
        }));
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('result',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'PressStart2P'),)),
            content: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height:30 ,
                    ),
                    Text(
                      gamestr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontFamily: 'PressStart2P'),
                    ),

                  ],
                ),
              ),
              width: 300.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(new Radius.circular(32.0)),
              ),
            ),
            actions: [
              Center(
                child: MaterialButton(
                  color: Colors.black,
                  elevation: 5,
                  child: Text('reset',style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PressStart2P',
                      fontWeight: FontWeight.bold,
                      fontSize:14),),
                  onPressed: () {
                    setState(() {
                      reset();
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ],
          );
        });
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      listButton[i].str = '';
      listButton[i].enabled = true;
      listButton[i].clr = Colors.white;
    }
    player1 = [];
    player2 = [];

    color = Colors.transparent;
    x = 1.0;
    y = -0.2;
    axis = Axis.vertical;
    rAngle = 0;
    lineLength=200;
  }

  int checkWinner(var player) {
    if (player.contains(0) && player.contains(1) && player.contains(2)) {
      return 1;
    }

    if (player.contains(3) && player.contains(4) && player.contains(5)) {
      return 2;
    }

    if (player.contains(6) && player.contains(7) && player.contains(8)) {
      return 3;
    }

    if (player.contains(0) && player.contains(3) && player.contains(6)) {
      return 4;
    }

    if (player.contains(1) && player.contains(4) && player.contains(7)) {
      return 5;
    }

    if (player.contains(2) && player.contains(5) && player.contains(8)) {
      return 6;
    }

    if (player.contains(0) && player.contains(4) && player.contains(8)) {
      return 7;
    }

    if (player.contains(2) && player.contains(4) && player.contains(6)) {
      return 8;
    }

    return 0;
  }

  void playGame(int index) {
    // player 1
    if (listButton[index].enabled) {
      listButton[index].str = 'X';
      listButton[index].enabled = false;
      listButton[index].clr = Colors.white;
      player1.add(index);
    }
    gameisdone = true;
    //check if the game ended
    for (int i = 0; i <= 8; i++) {
      if (listButton[i].enabled) {
        gameisdone = false;
      }
    }
    if (gameisdone) {
      gamestr = 'DRAW';
      waitpop();
    }

    if (1 <= checkWinner(player1) && checkWinner(player1) <= 8) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.white;
      }

      I1++;
      gamestr = "X WINS";
      if (checkWinner(player1) == 1) {player1 = [0, 1, 2];color=Colors.red;x=0.09;y=-0.75;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player1) == 2) {player1 = [3, 4, 5];color=Colors.red;x=0.09;y=-0.17;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player1) == 4) {player1 = [0, 3, 6];color=Colors.red;x=-0.7;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player1) == 3) {player1 = [6, 7, 8];color=Colors.red;x=0.09;y=0.4;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player1) == 5) {player1 = [1, 4, 7];color=Colors.red;x=-0.02;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player1) == 6) {player1 = [2, 5, 8];color=Colors.red;x=0.66;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player1) == 7) {player1 = [0, 4, 8];color=Colors.red;x=0.0;y=0.1;axis=Axis.horizontal;lineLength=390;rAngle=-40;k=-0.1;l=-0.03;};
      if (checkWinner(player1) == 8) {player1 = [2, 4, 6];color=Colors.red;x=1;y=1;axis=Axis.vertical;lineLength=390;rAngle=-40;k=0.4;l=0.17;};
      for (var element in player1) {
        listButton[element].clr = Colors.green;
      }
      playsound('win');
      gameisdone = true;
      waitpop();
      return;
    }

    // player 2
    // make the game more clever
    // player 2
    int solution=0;


    var allPlayedButtons = new List.from(player1)..addAll(player2);
    if (player1.contains(0) && player1.contains(1) && !player2.contains(2) && solution==0 ){
      if (!allPlayedButtons.contains(2)) {
        listButton[2].str = 'O';
        listButton[2].enabled = false;
        listButton[2].clr = Colors.white;
        player2.add(2);
        solution=solution+1;

      }
    } else if (player1.contains(3) && player1.contains(4) && !player2.contains(5) && solution==0  ) {
      if (!allPlayedButtons.contains(2)) {
        listButton[5].str = 'O';
        listButton[5].enabled = false;
        listButton[5].clr = Colors.white;
        player2.add(5);
        solution=solution+1;
      }
    } else if (player1.contains(6) && player1.contains(7)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(2)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.white;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(0) && player1.contains(3)&& !player2.contains(6) && solution==0 ) {
      if (!allPlayedButtons.contains(6)) {
        listButton[6].str = 'O';
        listButton[6].enabled = false;
        listButton[6].clr = Colors.white;
        player2.add(6);
        solution=solution+1;
      }
    } else if (player1.contains(1) && player1.contains(4)&& !player2.contains(7) && solution==0 ) {
      if (!allPlayedButtons.contains(7)) {
        listButton[7].str = 'O';
        listButton[7].enabled = false;
        listButton[7].clr = Colors.white;
        player2.add(7);
        solution=solution+1;
      }
    } else if (player1.contains(2) && player1.contains(5)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(8)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.white;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(0) && player1.contains(4)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(8)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.white;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(2) && player1.contains(4)&& !player2.contains(6) && solution==0 ) {
      if (!allPlayedButtons.contains(6)) {
        listButton[6].str = 'O';
        listButton[6].enabled = false;
        listButton[6].clr = Colors.white;
        player2.add(6);
        solution=solution+1;
      }
    } else {
      var allPlayedButtons = new List.from(player1)..addAll(player2);
      int max = 8;
      int random = Random().nextInt(max) + 1;
      while(allPlayedButtons.contains(random))
      {
        random =Random().nextInt(max)+1;
      }

      listButton[random].str='O';
      listButton[random].enabled=false;
      listButton[random].clr=Colors.white;
      player2.add(random);
    }

    if (1 <= checkWinner(player2) && checkWinner(player2) <= 8) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.white;
      }
      I2++;
      gamestr =  "O WINS";

      if (checkWinner(player2) == 1) {player2 = [0, 1, 2];color=Colors.red;x=0.09;y=-0.75;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player2) == 2) {player2 = [3, 4, 5];color=Colors.red;x=0.09;y=-0.17;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player2) == 4) {player2 = [0, 3, 6];color=Colors.red;x=-0.7;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player2) == 3) {player2 = [6, 7, 8];color=Colors.red;x=0.09;y=0.4;axis=Axis.horizontal;lineLength=270;};
      if (checkWinner(player2) == 5) {player2 = [1, 4, 7];color=Colors.red;x=-0.02;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player2) == 6) {player2 = [2, 5, 8];color=Colors.red;x=0.66;y=-0.3;axis=Axis.vertical;lineLength=270;};
      if (checkWinner(player2) == 7) {player2 = [0, 4, 8];color=Colors.red;x=0.0;y=0.1;axis=Axis.horizontal;lineLength=390;rAngle=-40;k=-0.1;l=-0.03;};
      if (checkWinner(player2) == 8) {player2 = [2, 4, 6];color=Colors.red;x=1;y=1;axis=Axis.vertical;lineLength=390;rAngle=-40;k=0.4;l=0.17;};
      for (var element in player2) {
        listButton[element].clr = Colors.green;
      }
      playsound('lose');
      gameisdone = true;
      waitpop();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              //right way: use context in below level tree with MaterialApp
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => difficulty_screen()));
            },
          ),
          title: Align(
            alignment: Alignment(-1, 0),
            child: Text("BACK",
                style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment(-0.1, 0),
              child: Text("TIC TAC TOE",
                  style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 10,
                child: Container(
                  color: Colors.white,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        bottom: 90,
                        left: 30,
                        right: 30,
                        child: Container(
                          color: Colors.black,
                          width: 382,
                          height: 350,
                        ),
                      ),
                      GridView.builder(
                          padding: const EdgeInsets.all(10.0),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return RaisedButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              elevation: 0,
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                listButton[index].str,
                                style: const TextStyle(
                                    fontFamily: 'PressStart2P',
                                    color: Colors.black,
                                    fontSize: 70.0),
                              ),
                              color: listButton[index].clr,
                              disabledColor: Colors.white,
                              onPressed: () {
                                //playsound(1);

                                setState(() {
                                  if (listButton[index].enabled) {
                                    playGame(index);
                                  } else if (gameisdone == false) {
                                    Fluttertoast.showToast(
                                        msg: "press another ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 20.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "press another ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 20.0);
                                  }
                                });
                              },
                            );
                          }),
                      if (y != 10.7)
                        Transform.rotate(
                          angle: rAngle,
                          alignment: Alignment(k, l),
                          child: buildDashedLine(color, x, y, axis, lineLength),
                        ),
                    ],
                  ),
                )),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'player X  player O',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'PressStart2P'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '$I1    -    $I2',
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),

      ),
    );
  }
}

Widget buildDashedLine(color, x, y, axis, lineLength) => Align(
  alignment: Alignment(x, y),
  child: DottedLine(
    direction: axis,
    dashColor: color,
    lineThickness: 20,
    dashGapLength: 10,
    dashLength: 40,
    lineLength: lineLength,
    dashRadius: 0,
  ),
);
