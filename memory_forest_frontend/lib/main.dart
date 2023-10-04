import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기억숲',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'NotoSansKR'
      ),
      home: LogInPage(),
    );
  }
}
