import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_icon_button.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/pause_screen.dart';
import 'package:wanderer/routes/app_routes.dart';

class RestartGame extends StatelessWidget {
  const RestartGame({
    required this.isGameOver,
    required this.pauseGame,
    required this.restartGame,
    required this.continueGame,
    this.color = Colors.white,
    super.key,
  });

  final VoidCallback pauseGame;
  final VoidCallback restartGame;
  final VoidCallback continueGame;
  final bool isGameOver;
  final Color color;

  Future<void> showGameControls(BuildContext context) async {
    pauseGame();
    var value = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (sheetContext) {
        return PauseScreen();
      },
    );

    value ??= false;

    if (value) {
      restartGame();
    } else {
      continueGame();
    }
  }

  void navigateback(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.initialRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.h),
      child: Row(
        children: [
          CustomIconButton(
            icon: Icons.menu,
            onTap: () =>
                isGameOver ? navigateback(context) : showGameControls(context),
          ),
        ],
      ),
    );
  }
}
