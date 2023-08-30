import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onProfilePressed;

  MyAppBar({
    required this.title,
    required this.onProfilePressed,
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
          onPressed: onProfilePressed,
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
