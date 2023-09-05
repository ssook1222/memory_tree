import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'ssook';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: null,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFFB6E166),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(0.1 * MediaQuery.of(context).size.width),
            child: Card(
              elevation: 4.0,
              color: Color(0xFFFFFFFF),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black, // 텍스트 색상 추가
                        ),
                        children: [
                          TextSpan(
                            text: '$name', // 변수 값 삽입
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' 님의',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0), // 여백 추가
                    Text(
                      '누적 결과 보고서입니다.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0), // 여백 추가
                    Row(
                      children: [
                        Container(
                          color: Colors.green, // 녹색 배경
                          width: MediaQuery.of(context).size.width - 120, // 화면 너비 - 100
                          height: 1.0, // 1px 높이
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0), // 여백 추가
                    Text(
                      '아래는 스크롤 여부를 확인하기 위한 테스트 코드입니다.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10.0), // 여백 추가
                    for (int i = 1; i < 26; i++)
                      Text(
                        'Profile Info $i',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    SizedBox(height: 10.0), // 아래 여백 추가
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onProfilePressed;

  MyAppBar({
    required this.title,
    required this.onProfilePressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void handleBackOrExit(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('앱 종료'),
            content: Text('앱을 종료하시겠습니까?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: onProfilePressed != null
          ? [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: onProfilePressed,
        ),
      ]
          : null,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_circle_left,
          color: Colors.white,
        ),
        onPressed: () {
          handleBackOrExit(context);
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
