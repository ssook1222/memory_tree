import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/message_bubble.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final int currentIndex;

  ChatScreen({
    required this.currentIndex,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _transcription = '';
  final List<Map<String, String>> chatData = [];

  // 음성 인식을 시작하는 함수
  void _startListening() async {
    if (await _speech.initialize()) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            _transcription = result.recognizedWords;
            // 음성 인식 결과를 chatData 리스트에 추가
            chatData.add({'user': _transcription});
            // 백엔드 API로 데이터 전송
            _sendDataToBackend(_transcription);
          });
        },
      );
    } else {
      print('음성 인식 초기화 실패');
      chatData.add({'user': 'failed'});
      _sendDataToBackend(_transcription);
    }
  }

  // 음성 인식을 중지하는 함수
  void _stopListening() {
    _speech.stop();
  }

  // 백엔드 API로 데이터 전송하는 함수
  Future<void> _sendDataToBackend(String data) async {
    // 데이터가 NULL인 경우 "안녕"으로 초기화
    if (data == null || data.isEmpty) {
      data = "안녕";
    }

    final apiUrl =
        'https://fluffy-waffle-75jv9vw6pjphxr46-8000.app.github.dev/api/gpt?message=$data';

    try {
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // API 응답을 문자열로 변환하여 chatItem에 추가
        final responseData = json.decode(response.body);
        final aiResponse = responseData['choices'][0]['text'];
        chatData.add({'AI': aiResponse});
        print(chatData);
      } else {
        print(apiUrl);
        print('API 호출 실패: ${response.statusCode}');
        chatData.add({'AI': 'API 호출 실패'});
      }
    } catch (e) {
      print('API 호출 중 오류 발생: $e');
      chatData.add({'AI': 'API 오류 발생'});
    }
  }


  @override
  void dispose() {
    _speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy.MM.dd');

    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'match',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 0.8 * MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateFormat.format(now),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              _transcription,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 음성 인식 중지 버튼을 추가
            ElevatedButton(
              onPressed: _stopListening,
              child: Text('음성 인식 중지'),
            ),

            ElevatedButton(
              onPressed: _startListening,
              child: Text('음성 인식 시작'),
            ),

            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                color: Color(0xFFB6E166).withOpacity(0.12),
                child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    final chatItem = chatData[index];
                    final sender = chatItem.keys.first;
                    final message = chatItem.values.first;
                    return MessageBubble(sender: sender, message: message);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(currentIndex: 0),
  ));
}
