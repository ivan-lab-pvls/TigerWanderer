import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/presentation/game_screen/models/game.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/game_over_panel.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/memory_card.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/mobile/game_timer_mobile.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/restart_game.dart';
import 'package:wanderer/theme/app_decoration.dart';

import '../../../../../theme/theme_helper.dart';

class GameBoardMobile extends StatefulWidget {
  const GameBoardMobile({
    required this.gameLevel,
    super.key,
  });

  static Widget builder(BuildContext context, int arguments) {
    return GameBoardMobile(
      gameLevel: arguments,
    );
  }

  final int gameLevel;

  @override
  State<GameBoardMobile> createState() => _GameBoardMobileState();
}

class _GameBoardMobileState extends State<GameBoardMobile> {
  late Timer timer;
  late Game game;
  late Duration duration;
  int bestTime = 0;
  bool showConfetti = false;

  @override
  void initState() {
    super.initState();
    game = Game(widget.gameLevel);
    duration = const Duration();
    startTimer();
    getBestTime();
  }

  void getBestTime() async {
    SharedPreferences gameSP = await SharedPreferences.getInstance();
    if (gameSP.getInt('${widget.gameLevel.toString()}BestTime') != null) {
      bestTime = gameSP.getInt('${widget.gameLevel.toString()}BestTime')!;
    }
    setState(() {});
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      setState(() {
        final seconds = duration.inSeconds + 1;
        duration = Duration(seconds: seconds);
      });

      if (game.isGameOver) {
        showGameOverPanel(context);
        timer.cancel();
        SharedPreferences gameSP = await SharedPreferences.getInstance();
        if (gameSP.getInt('${widget.gameLevel.toString()}BestTime') == null ||
            gameSP.getInt('${widget.gameLevel.toString()}BestTime')! >
                duration.inSeconds) {
          gameSP.setInt(
              '${widget.gameLevel.toString()}BestTime', duration.inSeconds);
          setState(() {


            bestTime = duration.inSeconds;
          });
        }
      }
    });
  }

   showGameOverPanel(BuildContext context)  {
     showCupertinoModalPopup<bool>(
      context: context,
      builder: (sheetContext) {
        return GameOverPanel();
      },
    );
  }

  pauseTimer() {
    timer.cancel();
  }

  void _resetGame() {
    game.resetGame();
    setState(() {
      timer.cancel();
      duration = const Duration();
      startTimer();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;
    final responsiveSpacing = sqrt(MediaQuery.of(context).size.width) *
        sqrt(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 86, 1),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        leadingWidget: Padding(
          padding: EdgeInsets.only(left: 50.h),
          child: Row(

            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 13.v, horizontal: 8.h),
                decoration: BoxDecoration(
                  color: appTheme.mainOrange,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft:  Radius.circular(10)),

                ),
                child: Text(
                    textAlign: TextAlign.center,
                    'Level',
                    style: theme.textTheme.titleLarge),
              ),
              Container(
                width: 60.h,
                padding: EdgeInsets.symmetric(vertical: 13.v, horizontal: 8.h),
                decoration: BoxDecoration(
                  color: appTheme.sandy,


                ),
                child: Text(
                    textAlign: TextAlign.center,
                    '1/5',
                    style: theme.textTheme.titleLarge),
              ),
            ],
          ),
        ),
        titleWidget: GameTimerMobile(
          time: duration,
        ),
        actionWidgets: [
          RestartGame(
            isGameOver: game.isGameOver,
            pauseGame: () => pauseTimer(),
            restartGame: () => _resetGame(),
            continueGame: () => startTimer(),
            color: Colors.amberAccent[700]!,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: AppDecoration.gradientLightToMain,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.h),
            child: Center(
              child: StaggeredGrid.count(
                // shrinkWrap: true,
                crossAxisCount: game.gridSize * 2,

                children: List.generate(game.cards.length, (index) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: MemoryCard(
                      index: index,
                      card: game.cards[index],
                      onCardPressed: (value) {
                        if (game.isClickable)
                          setState(() {
                            game.onCardPressed(value);
                          });
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
