import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/custom_card.dart'; // CustomCard가 정의된 파일을 import

class WordGameScreen extends StatelessWidget {
  final int currentIndex;

  WordGameScreen({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        onProfilePressed: 'word',
      ),
      body: Center(
        child: CustomCard(
          title1: '끝말잇기',
          context1: '지정된 제한시간 안에 상대방의\n끝말을 이전에 사용한 단어와\n겹치지 않게 이어주세요.\n',
          title2: '게임 규칙',
          context2: '● 60초 동안 끝맛잇기를 진행합니다. \n\n ● 시간 내에 중도 탈락 없이 완주하면 성공입니다. \n\n ● 3초 내에 상대방의 말을 잇지 못하거나, \n 이미 사용했던 단어를 똑같이 말하면 탈락입니다. ',
          chip1Text: '기억력',
          chip2Text: '어휘력',
          buttonText: '게임 시작하기',
          onPressed: () {
            // 버튼 클릭 시 수행할 작업
          },
        ),
      ),
    );
  }
}
