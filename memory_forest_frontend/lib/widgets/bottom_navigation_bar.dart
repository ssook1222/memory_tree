import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final List<Widget> screens; // 화면 목록을 전달받음

  BottomNavigationBarWidget({
    required this.currentIndex,
    required this.onTap,
    required this.screens, // 화면 목록을 생성자에서 받음
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index); // 전달된 onTap 콜백 함수 호출

        // 선택한 아이템에 해당하는 화면을 Navigator 스택에 push
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => screens[index],
          ),
        );
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green.shade800,
      unselectedItemColor: Colors.green.shade400,
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
