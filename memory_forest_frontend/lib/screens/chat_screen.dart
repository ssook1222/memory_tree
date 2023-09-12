import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';

class ChatScreen extends StatelessWidget {
  final int currentIndex;
  // final void Function(int) onTap;
  // final List<Widget> pages; // pages 매개변수 추가

  ChatScreen({
    required this.currentIndex,
    // required this.onTap,
    // required this.pages, // pages 매개변수 추가
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'chat',
      ),
      body: Center(
        child: Text('이곳에 대화하기 컨텐츠가 들어갑니다.'),
      )
    );
  }
}
