import 'package:flutter/material.dart';

class GameSuccessRateWidget extends StatelessWidget {
  final double successRate = 0.3; // 성공율 (0.0부터 1.0까지의 값)

  @override
  Widget build(BuildContext context) {
    final greenColor = Color(0xFF006400); // 어두운 녹색
    final whiteColor = Colors.white;

    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center, // 가운데 정렬을 추가
      decoration: BoxDecoration(
        border: Border.all(color: greenColor, width: 3.0),
        shape: BoxShape.circle,
      ),
      child: Text(
        '${(successRate * 100).toStringAsFixed(1)}%',
        style: TextStyle(
          color: greenColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
