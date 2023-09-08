import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 및 요일을 표시하기 위한 패키지

class ChatScreen extends StatelessWidget {
  final int currentIndex;

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
      appBar: AppBar(
        title: Text(''),
        actions: [
          // 프로필 버튼 또는 아이콘을 여기에 추가하세요
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // 프로필 버튼이 눌렸을 때 수행할 동작을 여기에 추가하세요
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 0.8 * MediaQuery.of(context).size.width, // 화면 80% 크기
              height: 50.0, // 높이를 원하는 크기로 조절하세요
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8), // 알파 80% 검은색 배경
                borderRadius: BorderRadius.circular(50.0), // 둥근 테두리
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateFormat.format(now), // 오늘 날짜 표시
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0), // 간격 조절
            Expanded(
              child: Container(
                color: Color(0xFFB6E166).withOpacity(0.12), // 녹색 배경
                // 화면을 꽉 채우기 위해 Expanded 위젯 사용
                // 다른 컨텐츠를 추가하려면 이 위치에 추가하세요
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
