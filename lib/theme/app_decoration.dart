import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get mainButtonsFill => BoxDecoration(
        color: appTheme.mainOrange,
        borderRadius: BorderRadius.circular(15),
  boxShadow: [BoxShadow(color: Colors.black.withAlpha(50), offset: Offset(2,2), blurRadius: 1),    ]
  );

  // Gradient decorations
  static BoxDecoration get gradientLightToMain => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, -1),
          end: Alignment(0.5, 0.3),
          colors: [
            appTheme.lightOrange,
            appTheme.mainOrange,
          ],
        ),
      );

  static BoxDecoration get blur => BoxDecoration(
    color: appTheme.mainOrange.withAlpha(150),
  );

  static BoxDecoration get gradientVinetka => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, -1.8),
          end: Alignment(0.5, 1.8),
          //stops: [0, 0.8, 1], // Добавляем стопы
          colors: [
            Colors.black.withOpacity(1), // Черный в начале
            Colors.white, // Прозрачный в середине
            Colors.black.withOpacity(1), // Черный в конце
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
