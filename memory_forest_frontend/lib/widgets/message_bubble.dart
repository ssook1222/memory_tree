import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;

  MessageBubble({
    required this.sender,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: sender == 'A'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: sender == 'A' ? Colors.white : Color(0xFF748154),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: sender == 'A' ? Color(0xFF748154) : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
