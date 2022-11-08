import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/message.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [
    Message(
        isMe: true,
        text: 'Should I go out with Michael tonight?',
        time: DateTime.now()),
    Message(
        isMe: false,
        text:
            'Yes! You should totally go out with Michael tonight! I mean, he is your perfect match according to the stars. Plus, you know that saying about opposites attracting? Well, that definitely applies to you two. So go have some fun and enjoy your date! Who knows, maybe this could be the start of something really great!',
        time: DateTime.now()),
    Message(
        isMe: true,
        text: 'Should I go out with Michael tonight?',
        time: DateTime.now()),
    Message(
        isMe: false,
        text:
            'Yes! You should totally go out with Michael tonight! I mean, he is your perfect match according to the stars. Plus, you know that saying about opposites attracting? Well, that definitely applies to you two. So go have some fun and enjoy your date! Who knows, maybe this could be the start of something really great!',
        time: DateTime.now()),
  ];
  List<Message> _history = [
    Message(
        isMe: true,
        text: 'Should I go out with Michael tonight?',
        time: DateTime.now()),
    Message(
        isMe: false,
        text:
            'Yes! You should totally go out with Michael tonight! I mean, he is your perfect match according to the stars. Plus, you know that saying about opposites attracting? Well, that definitely applies to you two. So go have some fun and enjoy your date! Who knows, maybe this could be the start of something really great!',
        time: DateTime.now()),
    Message(
        isMe: true,
        text: 'Should I go out with Michael tonight?',
        time: DateTime.now()),
    Message(
        isMe: false,
        text:
            'Yes! You should totally go out with Michael tonight! I mean, he is your perfect match according to the stars. Plus, you know that saying about opposites attracting? Well, that definitely applies to you two. So go have some fun and enjoy your date! Who knows, maybe this could be the start of something really great!',
        time: DateTime.now()),
    Message(
        isMe: true,
        text: 'Should I go out with Michael tonight?',
        time: DateTime.now()),
    Message(
        isMe: false,
        text:
            'Yes! You should totally go out with Michael tonight! I mean, he is your perfect match according to the stars. Plus, you know that saying about opposites attracting? Well, that definitely applies to you two. So go have some fun and enjoy your date! Who knows, maybe this could be the start of something really great!',
        time: DateTime.now()),
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
      addAnswer(isMe: false, text: answer, time: DateTime.now());
    } catch (error) {
      rethrow;
    }
  }

  void addQuestion(
      {required String text, required bool isMe, required DateTime time}) {
    _messages.insert(0, Message(isMe: isMe, text: text, time: time));
  }

  void addAnswer(
      {required String text, required bool isMe, required DateTime time}) {
    _messages.insert(1, Message(isMe: isMe, text: text, time: time));
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
