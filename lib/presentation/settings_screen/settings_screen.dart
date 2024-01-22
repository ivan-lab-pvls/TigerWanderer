import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/presentation/main_menu_screen/main_menu_screen.dart';
import 'package:wanderer/routes/app_routes.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/theme_helper.dart';
import '../custom_widgets/custom_body_button.dart';
import '../custom_widgets/custom_icon_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  static Widget builder(BuildContext context) {
    return SettingsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 86, 1),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        leadingWidget: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50.h),
              child: CustomIconButton(
                icon: Icons.arrow_back,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
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
                    'Settings',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 4.0),
                    child: CustomBodyButton(
                      text: 'Share with friends',
                      onTap: () => {
                        Share.share('Check out this Tiger Wanderer Game! Download - https://apps.apple.com/us/app/wanderer-game-dust/id6476459780')
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Privacy Policy',
                      onTap: () => {
                         Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SetCxx(
                                sad: 'https://docs.google.com/document/d/16pGZSlkPIY_I_mzoFsxUWno6WHA8R899YV00TcdkIqk/edit?usp=sharing'),
                          ))
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Term of use',
                      onTap: () => {
                         Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SetCxx(
                                sad: 'https://docs.google.com/document/d/1_iZv6DV9AyHlvuF3L3bA-vG6BMwYmHSPqSfvJ_Ztu_E/edit?usp=sharing'),
                          ))
                      },
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
