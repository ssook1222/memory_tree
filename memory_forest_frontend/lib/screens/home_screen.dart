import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  final int currentIndex;

  HomeScreen({
    required this.currentIndex,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String name = 'ssook';
  int thisMonthCount = 188; // 이번 달 초기값 설정
  int lastMonthCount = 150; // 지난 달 초기값 설정

  void updateCounts(int thisMonth, int lastMonth) {
    setState(() {
      thisMonthCount = thisMonth; // 이번 달 데이터 업데이트
      lastMonthCount = lastMonth; // 지난 달 데이터 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'home'
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
                SizedBox(height: 20),
                Text(
                  '${name}님, \n오늘의 하루는 어떠셨나요?\n',
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
                  color: Colors.green.shade100,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Text(
                  '놀라워요!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20), // 문장 사이 간격 추가
                Text(
                  '저번 주보다 ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5), // 문장 사이 간격 추가
                Row(
                    children: [
                      Text(
                        '${thisMonthCount - lastMonthCount}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '개의 단어를',
                        style: TextStyle(fontSize: 18),
                      )
                    ]
                ),
                SizedBox(height: 5), // 문장 사이 간격 추가

                Text(
                  '더 많이 말하셨어요.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20), // 문장 사이 간격 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 막대 간격 조절
                  children: [
                    Container(
                      width: 20, // 막대의 너비
                      height: (thisMonthCount.toDouble() * 0.5), // 막대의 높이를 이번 달 데이터에 따라 동적으로 설정
                      color: Colors.green.shade800, // 막대의 색상
                    ),
                    Container(
                      width: 20, // 막대의 너비
                      height: (lastMonthCount.toDouble() * 0.5), // 막대의 높이를 지난 달 데이터에 따라 동적으로 설정
                      color: Colors.green.shade100, // 막대의 색상
                    ),
                  ],
                ),
                Container(
                  height: 1, // 선의 높이를 조절
                  color: Colors.green.shade100, // 축의 색상 변경
                  margin: EdgeInsets.symmetric(vertical: 10), // 여백을 크게 조절
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 막대 간격 조절
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '이번 달',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '지난 달',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
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
