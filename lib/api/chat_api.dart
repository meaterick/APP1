import 'dart:ffi';

import 'package:app1_school/models/chat_message.dart';
import 'package:dart_openai/openai.dart';

  class ChatApi {
  static const _model = 'gpt-3.5-turbo';

  ChatApi() {
    OpenAI.apiKey = "";
  }

  Future<String> completeChat(List<ChatMessage> messages, {bool isCounselor = false}) async {
    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: [
        ...messages.map((e) => OpenAIChatCompletionChoiceMessageModel(
          role: e.isUserMessage ? OpenAIChatMessageRole.user : OpenAIChatMessageRole.assistant,
          content: e.content,
        )),
        if (isCounselor)
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.assistant,
            content: '진로상담사의 메시지', // 진로상담사의 메시지를 입력하세요
          ),
      ],
    );
    return chatCompletion.choices.last.message.content;
  }
}

