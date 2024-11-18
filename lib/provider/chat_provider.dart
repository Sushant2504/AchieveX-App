import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatProvider extends ChangeNotifier {
  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Hussain', lastName: 'Mustafa');

  final ChatUser _gptChatUser =
      ChatUser(id: '2', firstName: 'Eva', lastName: 'Ai');

  ChatUser get currentUser => _currentUser;
  ChatUser get gptChatUser => _gptChatUser;
  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<ChatUser> _typingUsers = <ChatUser>[];

  List<ChatMessage> get messages => _messages;
  List<ChatUser> get typingUsers => _typingUsers;

  final _openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  Future<void> getChatResponse(ChatMessage m) async {
    _messages.insert(0, m);
    _typingUsers.add(_gptChatUser);
    notifyListeners();
    List<Messages> messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();

    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      //  GptTurbo0301ChatModel(),
      messages: messagesHistory,
      maxToken: 200,
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        _messages.insert(
          0,
          ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content),
        );
        // notifyListeners();
      }
    }

    _typingUsers.remove(_gptChatUser);
    notifyListeners();
  }

  Future<void> loadList(List<String> myList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myList = prefs.getStringList('chatHistory') ?? [];
    notifyListeners();
  }

  Future<void> saveList(List<String> myList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('chatHistory', myList);
  }

  void clearList(List<String> myList) {
    myList.clear();
    notifyListeners();
  }
}
