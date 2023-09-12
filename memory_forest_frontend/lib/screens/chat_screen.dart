import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/message_bubble.dart';
import 'package:intl/intl.dart'; // 날짜 및 요일을 표시하기 위한 패키지

class ChatScreen extends StatelessWidget {
  final int currentIndex;

  final List<Map<String, String>> chatData = [
    {'A': 'Hello'},
    {'B': 'Hi'},
    // 여기에 추가적인 채팅 데이터를 넣으세요.
  ];

  ChatScreen({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // 현재 날짜와 요일을 가져옴
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy.MM.dd'); // 원하는 날짜 형식
    final dayFormat = DateFormat('EEEE'); // 요일 표시 형식

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
