import 'package:flutter/material.dart';

class UsedWordRankingWidget extends StatelessWidget {
  final List<String> dummyWordList = ['사랑', '금요일', '퇴근']; // 더미데이터

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '단어 Top 3',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        for (int i = 0; i < dummyWordList.length && i < 3; i++)
          Text(
            '${i + 1}. ${dummyWordList[i]}',
            style: TextStyle(fontSize: 14),
          ),
      ],
    );
  }
}
