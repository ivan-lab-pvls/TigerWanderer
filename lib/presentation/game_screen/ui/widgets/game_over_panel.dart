import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_body_button.dart';
import 'package:wanderer/routes/app_routes.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/theme_helper.dart';

class GameOverPanel extends StatelessWidget {
  const GameOverPanel({
    Key? key,
  }) : super(key: key);

  static Widget builder(BuildContext context) {
    return GameOverPanel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: AppDecoration.blur,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: appTheme.lightOrange,
                borderRadius: BorderRadius.circular(15)),
            width: 300.h,
            height: 200.v,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Level complete',
                        style: theme.textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 8.v,
                      ),
                      Text(
                        'You’ve passed the hard\nlevel difficulty level.',
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomBodyButton(
                          text: 'Back to menu',
                          onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, AppRoutes.initialRoute, (route) => false),
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Expanded(
                        child: CustomBodyButton(
                          text: 'The next difficulty',
                          onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, AppRoutes.gameScreen, arguments: 4 , (route) => false),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
