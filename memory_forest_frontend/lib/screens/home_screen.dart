import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/bar_chart_widget.dart';

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
  int thisMonthCount = 188;
  int lastMonthCount = 150;

  // void updateCounts(int thisMonth, int lastMonth) {
  //   setState(() {
  //     thisMonthCount = thisMonth;
  //     lastMonthCount = lastMonth;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'home',
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
                BarChartWidget(
                  thisMonthCount: thisMonthCount,
                  lastMonthCount: lastMonthCount,
                ),
                // 나머지 코드
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
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
