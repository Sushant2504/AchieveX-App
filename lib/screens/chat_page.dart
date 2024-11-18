import 'package:achievex/provider/chat_provider.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChatProvider>(builder: (context, chat, child) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 45),
              child: Image.asset('assets/icons/eva-header.png'),
            ),
            Center(
              child: Image.asset('assets/icons/ai-blank.png'),
            ),
            DashChat(
                currentUser: chat.currentUser,
                typingUsers: chat.typingUsers,
                messageOptions: const MessageOptions(
                  currentUserContainerColor: Color.fromARGB(255, 255, 68, 68),
                  containerColor: Color.fromRGBO(0, 14, 166, 1),
                  textColor: Colors.white,
                ),
                onSend: (ChatMessage m) {
                  chat.getChatResponse(m);
                },
                messages: chat.messages),
          ],
        );
      }),
    );
  }
}

// class _ChatPageState extends State<ChatPage> {
//   final _openAI = OpenAI.instance.build(
//     token: "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",
//     baseOption: HttpSetup(
//       receiveTimeout: const Duration(
//         seconds: 5,
//       ),
//     ),
//     enableLog: true,
//   );

//   final ChatUser _currentUser =
//       ChatUser(id: '1', firstName: 'Hussain', lastName: 'Mustafa');

//   final ChatUser _gptChatUser =
//       ChatUser(id: '2', firstName: 'Eva', lastName: 'Ai');

//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final List<ChatUser> _typingUsers = <ChatUser>[];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 36, 62, 255),
//         title: const Text(
//           'EVA',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: DashChat(
//           currentUser: _currentUser,
//           typingUsers: _typingUsers,
        
//           messageOptions: const MessageOptions(
            
//             currentUserContainerColor: Colors.black,
//             containerColor: Color.fromRGBO(
//               0,
//               166,
//               126,
//               1,
//             ),
//             textColor: Colors.white,
//           ),
//           onSend: (ChatMessage m) {
//             getChatResponse(m);
//           },
//           messages: _messages),
//     );
//   }

//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       _messages.insert(0, m);
//       _typingUsers.add(_gptChatUser);
//     });
//     List<Messages> messagesHistory = _messages.reversed.map((m) {
//       if (m.user == _currentUser) {
//         return Messages(role: Role.user, content: m.text);
//       } else {
//         return Messages(role: Role.assistant, content: m.text);
//       }
//     }).toList();
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: messagesHistory,
//       maxToken: 200,
//     );
//     final response = await _openAI.onChatCompletion(request: request);
    // for (var element in response!.choices) {
    //   if (element.message != null) {
    //     setState(() {
    //       _messages.insert(
    //         0,
    //         ChatMessage(
    //             user: _gptChatUser,
    //             createdAt: DateTime.now(),
    //             text: element.message!.content),
    //       );
    //     });
    //   }
    // }
//     setState(() {
//       _typingUsers.remove(_gptChatUser);
//     });
//   }
// }
