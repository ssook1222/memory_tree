import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  BottomNavigationBarWidget({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green.shade800, // 선택된 아이템 색상
      unselectedItemColor: Colors.green.shade400, // 선택되지 않은 아이템 색상
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '기본화면',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '대화하기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad),
          label: '짝맞추기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: '끝말잇기',
        ),
      ],
    );
  }
}
