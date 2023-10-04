import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/bar_chart_widget.dart';
import 'package:memory_tree_frontend/widgets/used_word_ranking.dart';
import 'package:memory_tree_frontend/widgets/game_success_rate.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'ssook';
  int thisMonthCount = 188;
  int lastMonthCount = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'null',
      ),
      body: SafeArea(
        child : Container(
          alignment: Alignment.center,
          color: Color(0xFFB6E166),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(0.1 * MediaQuery.of(context).size.width),
              child: Card(
                elevation: 4.0,
                color: Color(0xFFFFFFFF),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black, // 텍스트 색상 추가
                          ),
                          children: [
                            TextSpan(
                              text: '$name', // 변수 값 삽입
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' 님의',
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0), // 여백 추가
                      Text(
                        '누적 결과 보고서입니다.',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0), // 여백 추가
                      Row(
                        children: [
                          Container(
                            color: Colors.green, // 녹색 배경
                            width: MediaQuery.of(context).size.width - 120, // 화면 너비 - 120으로 수정
                            height: 1.0, // 1px 높이
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0), // 여백 추가
                      // contents
                      BarChartWidget(
                        thisMonthCount: thisMonthCount,
                        lastMonthCount: lastMonthCount,
                      ),
                      SizedBox(height: 30.0), // 여백 추가
                      UsedWordRankingWidget(),
                      SizedBox(height: 30.0), // 여백 추가
                      Text(
                        '끝말잇기 성공률',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // 원을 중앙으로 정렬
                        children: [
                          GameSuccessRateWidget(),
                        ],
                      ),
                      SizedBox(height: 30.0),
                    ], // 이 부분 잘못된 괄호 수정
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
