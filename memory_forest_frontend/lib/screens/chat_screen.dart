import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/message_bubble.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
  bool isListening = false;
  bool isStarting = true;

  @override
  void initState() {
    super.initState();
    _sendDataToBackend1();
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
            Expanded(
              child: Container(
                color: Color(0xFFB6E166).withOpacity(0.12),
                child: chatData.isEmpty
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : _buildChatList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: chatData.length,
      itemBuilder: (context, index) {
        final chatItem = chatData[index];
        final sender = chatItem.keys.first;
        final message = chatItem.values.first;
        return MessageBubble(
          sender: sender,
          message: message,
          onPressedCallback: _showListeningModal,
        );
      },
    );
  }

  void _showListeningModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildListeningModal();
      },
    );
    _startListening();
  }

  Widget _buildListeningModal() {
    return WillPopScope(
      onWillPop: () async {
        _stopListening();
        return true;
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '음성 인식 중입니다.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _stopListening,
              child: Text('음성 인식 종료'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendDataToBackend1() async {
    final apiUrl =
        'https://bug-free-dollop-q457q76j654367v7-8000.app.github.dev/api/gpt/start';
    await _sendDataToBackend(apiUrl);
  }

  Future<void> _sendDataToBackend2(String data) async {
    if (data == null || data.isEmpty) {
      data = "안녕";
    }

    final apiUrl2 =
        'https://bug-free-dollop-q457q76j654367v7-8000.app.github.dev/api/gpt?message=$data';
    await _sendDataToBackend(apiUrl2);
  }

  Future<void> _sendDataToBackend(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = response.body;
        final aiResponse = responseData;
        setState(() {
          chatData.add({'AI': aiResponse});
        });
        print(chatData);
      } else {
        print('API 호출 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('API 호출 중 오류 발생: $e');
    }
  }

  void _startListening() async {
    if (await _speech.initialize()) {
      setState(() {
        isListening = true;
      });
      _speech.listen(
        onResult: (result) {
          setState(() {
            _transcription = result.recognizedWords;
          });
        },
      );
    } else {
      print('음성 인식 초기화 실패');
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      isListening = false;
    });
    _sendDataToBackend2(_transcription);
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(currentIndex: 0),
  ));
}
