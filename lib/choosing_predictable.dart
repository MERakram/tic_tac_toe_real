import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_real/difficulty_screen.dart';
import 'package:tic_tac_toe_real/vs_ai_predictable.dart';

import 'package:tic_tac_toe_real/vs_ai_predictable_o.dart';

class choosing_predictable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              title: Align(
                alignment: Alignment(-1,0),
                child: Text("BACK",style:TextStyle(fontFamily:'PressStart2P',
                    fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold)
                ),
              ),
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => difficulty_screen()));
                },
              ),
              backgroundColor: Colors.black),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Align(
                  alignment: Alignment(0, 1),
                  child: Text(
                    'PLAY WITH',
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Center(
                        child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                            child: const Text(
                              'X',
                              style: TextStyle(
                                  fontFamily: 'PressStart2P',
                                  color: Colors.black,
                                  fontSize: 70,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => vs_ai_predictable()));
                            }),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Center(
                        child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                            child: const Text(
                              'O',
                              style: TextStyle(
                                  fontFamily: 'PressStart2P',
                                  color: Colors.black,
                                  fontSize: 70,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => vs_ai_predictable_o()));
                            }),
                      ),

                    ]),],
            ),
          ),
        ));
  }
}
