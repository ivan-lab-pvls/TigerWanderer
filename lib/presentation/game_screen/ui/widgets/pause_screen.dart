import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/routes/app_routes.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/theme_helper.dart';
import '../../../custom_widgets/custom_body_button.dart';
import '../../../custom_widgets/custom_icon_button.dart';

class PauseScreen extends StatelessWidget {
  const PauseScreen({
    Key? key,
  }) : super(key: key);
  static Widget builder(BuildContext context) {
    return PauseScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 86, 1),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        leadingWidget: Container(),
        actionWidgets: [
          Padding(
            padding: EdgeInsets.only(right: 50.h),
            child: Row(
              children: [
                
                CustomIconButton(icon: Icons.settings,onTap: ()=>  Navigator.pushNamed(context, AppRoutes.settingsRoute),),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: AppDecoration.gradientLightToMain,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pause',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 4.0),
                    child: CustomBodyButton(
                      text: 'Continue',
                      onTap: () => Navigator.of(context).pop(false),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Restart',
                      onTap: () => Navigator.of(context).pop(true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Levels of difficult',
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.levelsRoute),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'To main',
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.initialRoute),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(text: 'Exit', onTap: () => exit(0)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /*  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'PAUSE',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () => Navigator.of(context).pop(false),
            title: 'CONTINUE',
            color: continueButtonColor,
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () => Navigator.of(context).pop(true),
            title: 'RESTART',
            color: restartButtonColor,
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MainMenuScreen();
                  },
                ),
                (Route<dynamic> route) => false,
              );
            },
            title: 'QUIT',
            color: quitButtonColor,
            width: 200,
          ),
          const SizedBox(height: 20),
        ],
      ),*/
    );
  }
}
