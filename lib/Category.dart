import 'dart:async';
import 'package:app1_school/api/chat_api.dart';
import 'package:app1_school/chat_page.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app1_school/splash.dart';
import 'package:get/get.dart';

class TitleProvider with ChangeNotifier {
  String _title = "";

  String get title => _title;

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }
}

class Category extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _Category();
}

class _Category extends State<Category> {

  CustomBox(String title, Color color) {
    return GestureDetector(
      onTap: () {
        TitleProvider titleProvider = Provider.of<TitleProvider>(context, listen: false);
        titleProvider.setTitle(title);
        Navigator.of(context).pushNamed("/ChatApp");

      },
      child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 170,
          height: 140,
          child: Container(
            child: Center(
              child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
          )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Icon(Icons.breakfast_dining_outlined, color: Colors.black,),
        backgroundColor: Colors.white),
      body: Container(
        height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Lists                                                             ",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBox("신체적활동", Colors.deepPurple),
                    CustomBox("예술활동", Colors.cyan),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBox("음악활동", Colors.yellow),
                    CustomBox("음식활동", Colors.pinkAccent),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBox("여행활동", Colors.purpleAccent),
                    CustomBox("책활동", Colors.green),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBox("수집활동", Colors.brown),
                    CustomBox("키우는활동", Colors.orange),
                  ],
                )
              ],
            ),
            )
      );
  }
}
