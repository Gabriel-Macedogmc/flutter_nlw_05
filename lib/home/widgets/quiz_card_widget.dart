import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/app_colors.dart';
import 'package:nlw_flutter/core/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/progress_indicator.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String completed;
  final double percent;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.completed,
    required this.percent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(height: 13),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 13),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  completed,
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(
                  value: percent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
