import 'package:flutter/material.dart';

import 'home_screen.dart';

class credits extends StatelessWidget {
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

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'BY:',
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'MERAGHNI AKRAM',
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
          Center(
            child: Text(
              'GAMA',
              style: TextStyle(
                  fontFamily: 'Shalimar',
                  color: Colors.red,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,),
                Center(
                  child: Text(
                    'SEKHRI THAMER',
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'T2ABIZZ',
                    style: TextStyle(
                        fontFamily: 'Shalimar',
                        color: Colors.red,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
