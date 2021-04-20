import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/app_colors.dart';
import 'package:nlw_flutter/core/app_images.dart';
import 'package:nlw_flutter/core/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/progress_indicator.dart';

class QuizCardWidget extends StatelessWidget {
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
              AppImages.blocks,
            ),
          ),
          SizedBox(height: 13),
          Text(
            'Gerenciamento de Estado',
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 13),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '3/10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(
                  value: 0.3,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
