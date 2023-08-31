import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String Title;
  final String Context;

  CustomCard({required this.Title, required this.Context});

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
              '$Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 8),
            Text(
              Context,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
