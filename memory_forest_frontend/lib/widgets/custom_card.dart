import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title1;
  final String title2;
  final String context1;
  final String context2;
  final String? chip1Text;
  final String? chip2Text;
  final String? buttonText;
  final VoidCallback? onPressed;

  CustomCard({
    required this.title1,
    required this.title2,
    required this.context1,
    required this.context2,
    this.chip1Text,
    this.chip2Text,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              title1,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.green.shade50,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (chip1Text != null)
                  Chip(
                    elevation: 2,
                    label: Text(chip1Text!),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.green.shade300,
                    side: BorderSide(
                      color: Colors.green.shade500, // 테두리 색상
                      width: 1.0, // 테두리 선 두께
                    ),
                  ),
                SizedBox(width: 8),
                if (chip2Text != null)
                  Chip(
                    elevation: 2,
                    label: Text(chip2Text!),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.green.shade300,
                    side: BorderSide(
                      color: Colors.green.shade500, // 테두리 색상
                      width: 1.0, // 테두리 선 두께
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "${context1}",
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              color: Colors.green.shade50,
              thickness: 1,
            ),
            SizedBox(height: 16),
            Text(
              "${title2}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "${context2}",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 30),
            if (buttonText != null && onPressed != null)
              Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText!),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
