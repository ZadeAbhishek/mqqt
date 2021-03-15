//import 'package:mqqt_test/hompage.dart';
//import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mqqt_test/hompage.dart';
import 'package:mqqt_test/mqtt%20/model%20/value_store.dart';
import 'package:mqqt_test/mqtt%20/mqtt_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'package:mqqt_test/mqtt%20/mqtt_connect.dart';
Mqqtmanager manager = new Mqqtmanager();
bool check = false;
void main() {
  // check = manager.connect();

  runApp(Loading());
  //await new Future.delayed(const Duration(seconds: 5));
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // var ok = checkconnection();
    manager.connect().then((valuecheck) {
      print(value);
      check = valuecheck;
      if (check) {
        new Timer(const Duration(seconds: 5), () => runApp(MyApp()));
      }
    });

    //new Timer(const Duration(seconds: 15), () => runApp(MyApp()));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCubeGrid(
                  color: Colors.blue,
                  size: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Connecting...',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
