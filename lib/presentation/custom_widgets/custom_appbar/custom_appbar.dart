import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final List<Widget>? actionWidgets;

  const CustomAppBar({super.key,  this.leadingWidget,  this.actionWidgets,  this.titleWidget});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 300.h,
      centerTitle: true,
      forceMaterialTransparency: true,
      leading: leadingWidget,
      title: titleWidget,
      actions: actionWidgets,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}


