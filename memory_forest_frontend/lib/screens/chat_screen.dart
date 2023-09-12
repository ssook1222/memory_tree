import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/message_bubble.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final int currentIndex;

  ChatScreen({
    required this.currentIndex,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> chatData = [
    {'A': 'Hello'},
    {'B': 'Hi'},
    // 여기에 추가적인 채팅 데이터를 넣으세요.
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy.MM.dd');

    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'match',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 0.8 * MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateFormat.format(now),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                color: Color(0xFFB6E166).withOpacity(0.12),
                child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    final chatItem = chatData[index];
                    final sender = chatItem.keys.first;
                    final message = chatItem.values.first;
                    return MessageBubble(sender: sender, message: message);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(currentIndex: 0),
  ));
}
