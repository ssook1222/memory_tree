import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onProfilePressed;
  final VoidCallback onBackPressed;

  MyAppBar({
    required this.title,
    required this.onProfilePressed,
    required this.onBackPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: onProfilePressed,
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_circle_left,
          color: Colors.white,
        ),
        onPressed: onBackPressed,
      ),
    );
  }
}
