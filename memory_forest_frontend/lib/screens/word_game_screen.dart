import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/bottom_navigation_bar.dart';

class WordGameScreen extends StatelessWidget {
  final int currentIndex;
  // final void Function(int) onTap;
  // final List<Widget> pages; // pages 매개변수 추가

  WordGameScreen({
    required this.currentIndex,
    // required this.onTap,
    // required this.pages, // pages 매개변수 추가
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: () {
          // 프로필 화면으로 이동
        },
      ),
      body: Center(
        child: Text('이곳에 끝말잇기 컨텐츠가 들어갑니다.'),
      )
    );
  }
}
