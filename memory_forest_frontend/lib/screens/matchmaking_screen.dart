import 'package:flutter/material.dart';
import 'package:memory_tree_frontend/widgets/app_bar_widget.dart';
import 'package:memory_tree_frontend/widgets/custom_card.dart';

class MatchMakingScreen extends StatelessWidget {
  final int currentIndex;
  // final void Function(int) onTap;
  // final List<Widget> pages; // pages 매개변수 추가

  MatchMakingScreen({
    required this.currentIndex,
    // required this.onTap,
    // required this.pages, // pages 매개변수 추가
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: ''
      ),
      body: Center(
        child: CustomCard(
          title1: '짝맞추기',
          context1: '지정된 제한시간 안에 상대방의\n카드를 뒤집어\n최대한 많은 짝을 맞추세요.\n',
          title2: '게임 규칙',
          context2: '● 동일한 그림의 패를 2개 선택해야 짝을 맞춘 것입니다. \n\n ● 총 50개의 쌍을 제한 시간 내에 맞춰야 성공입니다. \n\n ● 잘못 카드를 뒤집어도 게임이 종료되지 않습니다. \n\n ● 난이도 별로 제한시간이 달라집니다. ',
          chip1Text: '기억력',
          chip2Text: '인지력',
          buttonText: '게임 시작하기',
          onPressed: () {
            // 버튼 클릭 시 수행할 작업
          },
        ),
      )
    );
  }
}
