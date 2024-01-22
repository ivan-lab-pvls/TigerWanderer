import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/theme/app_decoration.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function? onTap;

  const CustomIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.mainButtonsFill,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onTap?.call(),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            width: 40.h,
            height: 40.v,
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
