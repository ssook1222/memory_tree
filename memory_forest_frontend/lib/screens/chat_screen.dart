import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: () {
          // 프로필 화면으로 이동하는 동작을 여기에 추가
          // Navigator.push(context, MaterialPageRoute(...));
        },
        onBackPressed: () {
          // 뒤로 가는 동작을 여기에 추가
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Text('이곳에 대화하기 컨텐츠가 들어갑니다.'),
      ),
    );
  }
}
