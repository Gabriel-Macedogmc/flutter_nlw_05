import 'package:nlw_flutter/core/app_text_styles.dart';

import 'package:nlw_flutter/core/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:nlw_flutter/home/widgets/score_card.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 162,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: 'Gabriel',
                                style: AppTextStyles.titleBold,
                              )
                            ]),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/67282310?s=400&u=e074ed1ff991b20acaf9cb7a6354162a3dc0c62b&v=4'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1), child: ScoreCardWidget()),
              ],
            ),
          ),
        );
}
