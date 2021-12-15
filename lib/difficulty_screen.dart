import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_real/choosing_predictable.dart';
import 'choosing_easy.dart';
import 'choosing_hard.dart';
import 'choosing_medium.dart';
import 'home_screen.dart';

class difficulty_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(

            elevation: 0,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                //right way: use context in below level tree with MaterialApp
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            title: Align(
              alignment: Alignment(-1, 0),
              child: Text("BACK",
                  style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Align(
                  alignment: Alignment(0, 1),
                  child: Text(
                    'DIFFICULTY',
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                Center(
                  child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: const Text(
                        'PREDICTABLE',
                        style: TextStyle(
                            fontFamily: 'PressStart2P',
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => choosing_predictable()));
                      }),
                ),
                const SizedBox(
                  height: 19.0,
                  width: 300.0,
                ),
                Center(
                  child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      padding: EdgeInsets.fromLTRB(33, 0, 33, 0),
                      child: const Text(
                        'EASY',
                        style: TextStyle(
                            fontFamily: 'PressStart2P',
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => choosing_easy()));
                      }),
                ),
                const SizedBox(
                  height: 19.0,
                  width: 300.0,
                ),
                Center(
                  child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      child: const Text(
                        'MEDIUM',
                        style: TextStyle(
                            fontFamily: 'PressStart2P',
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => choosing_medium()));
                      }),
                ),
                const SizedBox(
                  height: 19.0,
                  width: 300.0,
                ),
                Center(
                  child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(33, 0, 33, 0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      child: const Text(
                        'HARD',
                        style: TextStyle(
                            fontFamily: 'PressStart2P',
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => choosing_hard()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
