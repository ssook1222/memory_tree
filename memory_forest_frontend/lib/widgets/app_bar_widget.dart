import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memory_tree_frontend/screens/profile.dart'; // 프로필 화면 파일을 import

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  MyAppBar({
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  // 뒤로 가기 또는 종료 팝업을 처리하는 함수
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
                  SystemNavigator.pop(); // 앱 종료
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
      actions: [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            // 프로필 버튼이 눌렸을 때 profile.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()), // ProfileScreen으로 이동
            );
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_circle_left,
          color: Colors.white,
        ),
        onPressed: () {
          handleBackOrExit(context); // 수정된 콜백 함수 사용
        },
      ),
    );
  }
}
