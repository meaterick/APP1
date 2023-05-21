import 'package:app1_school/api/chat_api.dart';
import 'package:app1_school/models/chat_message.dart';
import 'package:app1_school/widgets/message_bubble.dart';
import 'package:app1_school/widgets/message_composer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Category.dart';

String hobby = "";

class ChatPage extends StatefulWidget {

  const ChatPage({
    required this.chatApi,
    super.key,
  });

  final ChatApi chatApi;

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {
  final _messages = <ChatMessage>[
    ChatMessage('Hello, how can I help?', false),
  ];
  var _awaitingResponse = false;

  @override
  Widget build(BuildContext context) {
    TitleProvider titleProvider = Provider.of<TitleProvider>(context);
    String title = titleProvider.title;
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Icon(Icons.breakfast_dining_outlined,
            color: Colors.black,),
          // Text(title,
          //   style: TextStyle(
          //     color: Colors.black
          //   )
          // ),
          Text("     " + hobby, style:
            TextStyle(
              color: Colors.black
            ),)
        ],
      ),
      backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ..._messages.map(
                      (msg) => MessageBubble(
                    content: msg.content,
                    isUserMessage: msg.isUserMessage,
                  ),
                ),
              ],
            ),
          ),
          MessageComposer(
            onSubmitted: _onSubmitted,
            awaitingResponse: _awaitingResponse,
          ),
        ],
      ),
    );
  }

  List _Q = [];

  Future<void> _onSubmitted(String message) async {

    setState(() {
      _messages.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });
    try {
      final response = await widget.chatApi.completeChat(_messages);
      setState(() {
        _messages.add(ChatMessage(response, false));
        _awaitingResponse = false;
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.1')),
      );
      setState(() {
        _awaitingResponse = false;
      });
    }
  }

  Future<void> _onSubmitted2(String message) async {
    _Q.add(message.toString());
    String Q = _Q.map((item) => '"$item"').join(", ");
    Q = "Tell the person who asked " + Q + " what your hobbies are in one word.";

    final rQ = <ChatMessage>[
      ChatMessage(Q, false),
    ];

    setState(() {
      rQ.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });
    try {
      hobby = await widget.chatApi.completeChat(rQ);
      setState(() {
        _awaitingResponse = false;
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.2')),
      );
      setState(() {
        _awaitingResponse = false;
      });
    }
  }
}