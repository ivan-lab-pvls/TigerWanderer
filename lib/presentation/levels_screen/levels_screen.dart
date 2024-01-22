import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/image_constant.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/presentation/custom_widgets/custom_body_button.dart';
import 'package:wanderer/presentation/custom_widgets/custom_icon_button.dart';
import 'package:wanderer/presentation/custom_widgets/custom_image_view.dart';
import 'package:wanderer/presentation/game_screen/ui/widgets/mobile/game_board_mobile.dart';
import 'package:wanderer/routes/app_routes.dart';
import 'package:wanderer/theme/theme_helper.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  static Widget builder(BuildContext context) {
    return LevelsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 86, 1),
      extendBody: true,
      extendBodyBehindAppBar: true,
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
        actionWidgets: [
          Padding(
            padding: EdgeInsets.only(right: 50.h),
            child: Row(
              children: [
                
                CustomIconButton(icon: Icons.settings, onTap: ()=>  Navigator.pushNamed(context, AppRoutes.settingsRoute),),
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
            imagePath: ImageConstant.imgLevelBackground,
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
                    'Levels of difficulty',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 4.0),
                    child: CustomBodyButton(
                      text: 'Easy',
                      onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.gameScreen, arguments: 4)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Normal',  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.gameScreen, arguments: 6)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Hard',  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.gameScreen, arguments: 8)
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
