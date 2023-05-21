import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app1_school/main.dart';
import 'package:app1_school/ChatApp.dart';

class Splash extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.badge_sharp),
                  Text("Hobbang"),
            ],
          ),
      ),
    )
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed("/Category");
    });
  }
}








