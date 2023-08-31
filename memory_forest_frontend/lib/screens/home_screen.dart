import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  final int currentIndex;

  final String name = 'ssook';
  final int count = 188;

  HomeScreen({
    required this.currentIndex,
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
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  '\n${name}님, \n오늘의 하루는 어떠셨나요?\n',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 친구랑 이야기하러 가기 버튼 클릭 시 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade50, // 배경 색
                        onPrimary: Colors.green.shade900, // 텍스트 색
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // 테두리 모양
                        ),
                        side: BorderSide(
                          color: Colors.green.shade900, // 테두리 색상
                          width: 1.0, // 테두리 선 두께
                        ),
                      ),
                      child: Text('친구랑 이야기하러 가기'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(height: 8),
                Text(
                  '\n놀라워요! \n',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20), // 문장 사이 간격 추가
                Text(
                  '저번 주보다 ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10), // 문장 사이 간격 추가
                Row(
                    children: [
                      Text(
                        '$count',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '개의 단어를',
                        style: TextStyle(fontSize: 18),
                      )
                    ]
                ),
                SizedBox(height: 10), // 문장 사이 간격 추가
                Text(
                  '더 많이 말하셨어요.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 가장 많이 쓴 단어 보기 버튼 클릭 시 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade50, // 배경 색
                        onPrimary: Colors.green.shade900, // 텍스트 색
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // 테두리 모양
                        ),
                        side: BorderSide(
                          color: Colors.green.shade900, // 테두리 색상
                          width: 1.0, // 테두리 선 두께
                        ),
                      ),
                      child: Text('가장 많이 쓴 단어 보기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
