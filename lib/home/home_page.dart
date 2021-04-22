import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/widgets/quiz_widget.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/home/home_controller.dart';
import 'package:nlw_flutter/home/widgets/app_bar.dart';
import 'package:nlw_flutter/home/widgets/level_button_widget.dart';
import 'package:nlw_flutter/home/widgets/quiz_card_widget.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
    controller.geetQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: 'Fácil'),
                LevelButtonWidget(label: 'Médio'),
                LevelButtonWidget(label: 'Difícil'),
                LevelButtonWidget(label: 'Perito'),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                children: controller.quizzes!
                    .map((quizz) => QuizCardWidget(
                          title: quizz.title,
                          image: quizz.image,
                          percent:
                              quizz.questionsAwnsered / quizz.questions.length,
                          completed:
                              "${quizz.questionsAwnsered}/${quizz.questions.length}",
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
