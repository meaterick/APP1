import 'dart:async';
import 'package:app1_school/Category.dart';
import 'package:app1_school/api/chat_api.dart';
import 'package:app1_school/chat_page.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:app1_school/splash.dart';
import 'package:app1_school/ChatApp.dart';
import 'package:app1_school/Category.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';


void main() {

  final chatApi = ChatApi();
  runApp(
  ChangeNotifierProvider(
  create: (context) => TitleProvider(),
  child: MyApp(chatApi: chatApi,),
  ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({required this.chatApi, Key? key}) : super(key: key);
  final ChatApi chatApi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {"/": (context) => Splash(),
          "/ChatApp": (context) => ChatApp(chatApi: chatApi),
          "/Category": (context) =>  Category()},
    );
        }

}


//
// class MyApp extends StatelessWidget {
//   final ChatApi chatApi; // chatApi 변수 선언
//
//   const MyApp({required this.chatApi, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(chatApi: chatApi), // chatApi 전달
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   final ChatApi chatApi; // chatApi 변수 선언
//
//   const SplashScreen({required this.chatApi, Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   ChatApi() {
//     OpenAI.apiKey = "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";
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ChatApp(chatApi: ChatApi())),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Row(
//             children: [
//               Icon(Icons.barcode_reader),
//               Text("Hobbang"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }