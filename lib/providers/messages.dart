import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/message.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [];
  List<Message> _history = [
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
    Message(
        isMe: true, text: 'Some text written by user', time: DateTime.now()),
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
    Message(
        isMe: true, text: 'Some text written by user', time: DateTime.now()),
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
    Message(
        isMe: true, text: 'Some text written by user', time: DateTime.now()),
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
    Message(
        isMe: true, text: 'Some text written by user', time: DateTime.now()),
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
    Message(
        isMe: true, text: 'Some text written by user', time: DateTime.now()),
    Message(isMe: false, text: 'Some text written by AI', time: DateTime.now()),
  ];

  Future<void> getAnswer({required String text}) async {
    final url = Uri.parse('https://beast-ai-bot.herokuapp.com/jasper/question');
    try {
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: jsonEncode({
            'question': text,
          }));
      String answer = jsonDecode(response.body)['answer'];
      addMessage(isMe: false, text: answer, time: DateTime.now());
    } catch (error) {
      rethrow;
    }
  }

  void addMessage(
      {required String text, required bool isMe, required DateTime time}) {
    _messages.add(Message(isMe: isMe, text: text, time: time));
  }

  void addMessageHist(
      {required String text, required bool isMe, required DateTime time}) {
    _history.add(Message(isMe: isMe, text: text, time: time));
  }

  void clearMessages() {
    _messages = [];
  }

  void clearHistory() {
    _history = [];
  }

  List get messageshistorylist {
    return [..._history];
  }

  List get messageslist {
    return [..._messages];
  }
}
