import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotRepository {
  String url = 'https://taxiweb-production-500a.up.railway.app';

  Future<String> getAllMessage(String threads) async {
    final response = await http.get(
      Uri.parse('${url}/api/messages/run?threadId=${threads}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonEncode(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load messages');
    }
  }

  Future<String> createThreads() async {
    final response = await http.post(
      Uri.parse('${url}/api/threads/run'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return jsonEncode(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create threads');
    }
  }

  Future<void> sendMessage(String threads, String message) async {
    final response = await http.post(
      Uri.parse('${url}/api/messages/run'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "threadId": threads,
        "content": message,
      }),
    );
    if (response.statusCode == 200) {
      print('Success send message');
    } else {
      throw Exception('Failed to send message');
    }
  }

  Future<void> runAssistant(String threads, String instructions) async {
    final response = await http.post(
      Uri.parse('${url}/api/assistant/run'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "threadId": threads,
        "instructions": instructions,
      }),
    );
    if (response.statusCode == 200) {
      print('Success run assistant');
    } else {
      throw Exception('Failed to run assistant');
    }
  }
}
