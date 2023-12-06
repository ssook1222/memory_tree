import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final VoidCallback? onPressedCallback;

  MessageBubble({
    required this.sender,
    required this.message,
    required this.onPressedCallback,
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: sender == 'A' ? Colors.white : Color(0xFF748154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: onPressedCallback,
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
