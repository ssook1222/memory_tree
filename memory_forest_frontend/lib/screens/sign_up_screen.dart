import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmationController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isUserIdAvailable = false;
  bool _isPasswordValid = false;
  bool _isPasswordConfirmationValid = false;
  bool _isNameFilled = false;
  bool _isEmailFilled = false;

  void _checkUsernameAvailability() {

    String inputUsername = _usernameController.text;
    if (inputUsername == "testuser") {//예시 backend와 연결해야 함
      setState(() {
        _isUserIdAvailable = false;
      });
    } else {
      setState(() {
        _isUserIdAvailable = true;
      });
    }
  }

  void _checkPasswordValidity() {
    String password = _passwordController.text;
    // 비밀번호가 숫자, 영어, 특수문자 조합으로 8자 이상인지 확인
    bool hasNumber = password.contains(RegExp(r'[0-9]'));
    bool hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool isLengthValid = password.length >= 8;

    setState(() {
      _isPasswordValid = hasNumber && hasLetter && hasSpecialChar && isLengthValid;
    });
  }
  void _checkPasswordConfirmation() {
    String password = _passwordController.text;
    String confirmation = _passwordConfirmationController.text;

    setState(() {
      _isPasswordConfirmationValid = password == confirmation;
    });
  }
  void _handleSignUp() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String email = _emailController.text;

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        _isPasswordValid &&
        _isPasswordConfirmationValid &&
        _isUserIdAvailable &&
        name.isNotEmpty &&
        email.isNotEmpty) {
      
      print("회원가입 성공");
    } else {
      
      print("회원가입 실패");
    }
  }
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: "사용자 아이디",
                              labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                            ),
                          ),
                        ),
                        Padding(
                          padding : const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child : ElevatedButton(
                            onPressed: () {
                              _checkUsernameAvailability();
                            },
                            
                            style: ButtonStyle(
                              
                              side: MaterialStateProperty.all(
                                BorderSide(color: Colors.lightGreen),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            child: Text(
                              "중복 확인",
                              style: TextStyle(color: Colors.lightGreen),
                            ),
                          ),
                      
                        ),
                        ],
                    ),
                    
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 비밀번호",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                        helperText : "숫자,특수문자,영어 조합으로 8자 이상 작성해주세요",
                      ),
                      obscureText: true,
                      
                    ),
                    
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 비밀번호 재확인",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                      obscureText: true,
                      onChanged: (_) {
                        _checkPasswordConfirmation(); // 비밀번호 재확인이 변경될 때마다 검사
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "사용자 이름",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                      onChanged: (_) {
                        setState(() {
                          _isNameFilled = _nameController.text.isNotEmpty;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "보호자 이메일",
                        labelStyle: TextStyle(color: Colors.lightGreen), // 라벨 색상 변경
                      ),
                      onChanged: (_) {
                        setState(() {
                          _isEmailFilled = _emailController.text.isNotEmpty;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _handleSignUp();
                        
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
