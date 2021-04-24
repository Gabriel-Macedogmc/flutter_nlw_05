import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/challenge_controller.dart';
import 'package:nlw_flutter/challenge/widgets/next_button_widget.dart';
import 'package:nlw_flutter/challenge/widgets/question_indicator_widget.dart';
import 'package:nlw_flutter/challenge/widgets/quiz_widget.dart';
import 'package:nlw_flutter/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (ctx, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (questions) => QuizWidget(
                question: questions,
                onChanged: nextPage,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (ctx, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (value < widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.white(
                          label: 'Pular',
                          onTap: nextPage,
                        ),
                      ),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
