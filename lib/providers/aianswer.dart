import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class AiAnswer with ChangeNotifier {
  String answer = '';

  Future<void> getData({required String text}) async {
    final url = Uri.parse('https://beast-ai-bot.herokuapp.com/jasper/question');
    try {
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: jsonEncode({
            'question': text,
          }));
      answer = jsonDecode(response.body)['answer'];
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  String get aianswer {
    return answer;
  }
}
