import 'package:flutter/material.dart';
import 'package:nlw_flutter/home/widgets/app_bar.dart';
import 'package:nlw_flutter/home/widgets/level_button_widget.dart';
import 'package:nlw_flutter/home/widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
              children: [
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
