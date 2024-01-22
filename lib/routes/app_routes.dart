
import 'package:flutter/material.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/mobile/game_board_mobile.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/pause_screen.dart';
import 'package:wanderer/presentation/levels_screen/levels_screen.dart';
import 'package:wanderer/presentation/main_menu_screen/main_menu_screen.dart';
import 'package:wanderer/presentation/settings_screen/settings_screen.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String levelsRoute = '/levelsRoute';
  static const String settingsRoute = '/settingsRoute';
  static const String pauseScreen = '/pauseScreen';
  static const String gameScreen = '/gameScreen';

  static Map<String, WidgetBuilder> get routes =>
      {
        initialRoute: MainMenuScreen.builder,
        levelsRoute: LevelsScreen.builder,
        settingsRoute: SettingsScreen.builder,
        pauseScreen: PauseScreen.builder,
        gameScreen: (context) {
          final arguments =
          ModalRoute.of(context)!.settings.arguments as int;
          return GameBoardMobile.builder(context, arguments);
        }
      };
}
