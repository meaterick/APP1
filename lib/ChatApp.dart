import 'dart:async';
import 'package:app1_school/api/chat_api.dart';
import 'package:app1_school/chat_page.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:app1_school/splash.dart';

class ChatApp extends StatelessWidget {

  const ChatApp({required this.chatApi, Key? key}) : super(key: key);
  final ChatApi chatApi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.lime,
        ),
      ),
      home: ChatPage(chatApi: chatApi),
    );
  }
}
