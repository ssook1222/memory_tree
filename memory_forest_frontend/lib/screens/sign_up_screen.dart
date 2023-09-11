import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 첫 번째 블럭: 환영 문구
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "기억 숲에",
                    style: TextStyle(
                      fontSize: 35.0, // 폰트 크기 35로 변경
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Text(
                    "오신 당신을",
                    style: TextStyle(
                      fontSize: 35.0, // 폰트 크기 35로 변경
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Text(
                    "환영합니다!",
                    style: TextStyle(
                      fontSize: 35.0, // 폰트 크기 35로 변경
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
            // 두 번째 블럭: 회원가입 폼
            Expanded( // 두 번째 블럭을 Expanded로 감싸서 사용 가능한 공간을 채웁니다.
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 아이디",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 비밀번호",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                      
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 비밀번호 재확인",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                      
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 이름",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "보호자 이메일",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 회원가입 로직 추가
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.lightGreen)),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(8.0)),
                      ),
                      child: Text(
                        "회원가입",
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
