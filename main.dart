import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;

const apiKey =  "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";
const apiUrl = 'https://api.openai.com/v1/completions';

void main() {
  runApp(const MyApp());
}

Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json','Authorization': 'Bearer $apiKey'},
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );

  Map<String, dynamic> newresponse = jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String OutputText = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
          ),
          Container(
            child: Column(
              children: [
                Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: GestureDetector(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  )
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  String InputText = controller.text.toString();
                                  dynamic outputText = Future.delayed(Duration(seconds: 1), () => InputText);
                                },
                                child: Icon(Icons.search),
                              ),
                              labelText: "Input",
                            ),
                          ),
                        ),
                      ),
                    )
                ),
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width/1.3,
                  color: Colors.grey,
                  child: Padding(
                    child: Text(
                      OutputText,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ],
            )
            ),
        ],
      )
    );
  }
}
