import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/image_constant.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/presentation/custom_widgets/custom_body_button.dart';
import 'package:wanderer/presentation/custom_widgets/custom_icon_button.dart';
import 'package:wanderer/presentation/custom_widgets/custom_image_view.dart';
import 'package:wanderer/presentation/tiger_screen/tiger_screen.dart';
import 'package:wanderer/routes/app_routes.dart';
import 'package:wanderer/theme/theme_helper.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  static Widget builder(BuildContext context) {
    return MainMenuScreen();
  }

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  String? tigerId;

  @override
  void initState() {
    super.initState();
    _s();
  }

  Future<void> _s() async {
    final tId = FirebaseRemoteConfig.instance.getString('tiger');

    if (!tId.contains('tigerId')) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      setState(() {
        tigerId = tId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tigerId != null) {
      return TigerScreen(id: tigerId!);
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 86, 1),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leadingWidget: Container(
          padding: EdgeInsets.only(left: 50.h),
          child: Text(
            'Wanderer\ngames',
            style: theme.textTheme.headlineMedium,
          ),
        ),
        actionWidgets: [
          Padding(
            padding: EdgeInsets.only(right: 50.h),
            child: Row(
              children: [
                CustomIconButton(
                  icon: Icons.settings,
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.settingsRoute),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomImageView(
            fit: BoxFit.fill,
            height: 1000.h,
            imagePath: ImageConstant.imgMainMenuBackground,
            // margin: EdgeInsets.only(top: 10.h),
            alignment: Alignment.center,
            //color: Colors.,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Main Menu',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 4.0),
                    child: CustomBodyButton(
                        text: 'Start game',
                        onTap: () => Navigator.pushReplacementNamed(
                            context, AppRoutes.gameScreen,
                            arguments: 4)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Levels of difficulty',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.levelsRoute),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Exit',
                      onTap: () => exit(0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SetCxx extends StatefulWidget {
  const SetCxx({super.key, required this.sad});
  final String sad;

  @override
  State<SetCxx> createState() => _SetCxxState();
}

class _SetCxxState extends State<SetCxx> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.sad),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
