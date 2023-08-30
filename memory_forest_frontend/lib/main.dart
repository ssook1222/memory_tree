import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/screens/home_screen.dart';
import 'package:memory_tree_frontend/screens/chat_screen.dart';
import 'package:memory_tree_frontend/screens/matchmaking_screen.dart';
import 'package:memory_tree_frontend/screens/word_game_screen.dart';
import 'package:memory_tree_frontend/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(
      currentIndex: 0
    ),
    ChatScreen(
      currentIndex: 1
    ),
    MatchMakingScreen(
      currentIndex: 2
    ),
    WordGameScreen(
      currentIndex: 3
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        screens: _pages,
      ),
    );
  }
}