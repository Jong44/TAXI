import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/repository/Chatbot/ChatbotRepository.dart';

class ChatbotService {
  final ChatbotRepository _chatbotRepository = ChatbotRepository();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getStoredThreads() async {
    await init();
    return _prefs.getString('threads') ?? '';
  }

  Future<Map<String, dynamic>> getMessage() async {
    await init();
    String threads = await getStoredThreads();
    print(threads);
    Map<String, dynamic> data =
        jsonDecode(await _chatbotRepository.getAllMessage(threads));
    return data;
  }

  Future<void> createThreads() async {
    await init();
    Map<String, dynamic> data =
        jsonDecode(await _chatbotRepository.createThreads());
    print(data['id']);
    _prefs.setString('threads', data['id']);
  }

  Future<void> sendMessage(String message) async {
    await init();
    String threads = await getStoredThreads();
    await _chatbotRepository.sendMessage(threads, message);
    await runAssistant(message);
  }

  Future<void> runAssistant(String instructions) async {
    await init();
    String threads = await getStoredThreads();
    await _chatbotRepository.runAssistant(threads, instructions);
  }
}
