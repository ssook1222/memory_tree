import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final int thisMonthCount;
  final int lastMonthCount;

  BarChartWidget({
    required this.thisMonthCount,
    required this.lastMonthCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
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
        // 이하 그래프와 관련된 코드를 이곳으로 이동
        // ...
      ],
    );
  }
}
