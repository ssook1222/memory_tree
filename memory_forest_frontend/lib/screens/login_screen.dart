import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/screens/sign_up_screen.dart';
import 'package:memory_tree_frontend/screens/main_screen.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('입력 오류'),
          content: Text(message),
          actions: [
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
  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context, '아이디와 비밀번호를 입력해주세요.');
      return;
    }

    // 로그인 버튼을 눌렀을 때 실행될 코드
    // 2023-09-11 일단 로그인 버튼 눌렀을 때, 메인 화면이랑 연결되도록 수정 - SSOOK
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea를 사용하여 상단과 하단의 SafeArea를 고려
        child: Column(
          children: [
            // 첫 번째 블럭: 환영 문구
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "기억 숲에\n어서오세요!",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 두 번째 블럭: 로그인 폼
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 사용자 아이디 필드
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "사용자 아이디",
                      ),
                    ),
                    // 비밀번호 필드
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "비밀번호",
                      ),
                      obscureText: true, // 비밀번호를 숨김
                    ),
                    SizedBox(height: 16.0), // 간격 추가
                    // 로그인 버튼
                    ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: Colors.lightGreen)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        minimumSize: MaterialStateProperty.all(Size(
                          double.infinity,
                          0,
                        )),
                        padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                      ),
                      child: Text(
                        "로그인",
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ),
                    // 회원가입 문구 및 네비게이션
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("계정이 없으신가요?"),
                        TextButton(
                          onPressed: () {
                            // 회원가입 화면으로 이동하는 네비게이션 추가
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()), // SignUpPage로 이동
                            );
                          },
                          child: Text("회원가입"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 마지막 빈 블럭
            // Expanded(
            //   flex: 1,
            //   child: Container(),
            // ),
          ],
        ),
      ),
    );
  }
}


