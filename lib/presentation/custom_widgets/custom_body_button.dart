import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/theme/app_decoration.dart';
import 'package:wanderer/theme/theme_helper.dart';

class CustomBodyButton extends StatelessWidget {
  final String text;
  final Function? onTap;

  const CustomBodyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.mainButtonsFill,
      child:   Material(
        type: MaterialType.transparency,
        shadowColor: Colors.grey,
        child: InkWell(
          onTap: () => onTap?.call(),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            width: 300.h,
            height: 50.v,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
