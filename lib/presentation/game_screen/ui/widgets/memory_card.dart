import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/image_constant.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_image_view.dart';
import 'package:wanderer/presentation/game_screen/models/card_item.dart';
import 'package:wanderer/theme/theme_helper.dart';

class MemoryCard extends StatelessWidget {
  const MemoryCard({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardItem card;
  final int index;
  final ValueChanged<int> onCardPressed;

  void _handleCardTap() {
    if (card.state == CardState.hidden) {
      onCardPressed(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleCardTap,
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color:
            card.state == CardState.visible || card.state == CardState.guessed
                ? appTheme.sandy
                : appTheme.lightOrange,
        child: Center(
          child: card.state == CardState.hidden
              ? SizedBox(
                  width: 70.h,
                  height: 70.h,
                  child: FittedBox(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFootprints,
                      // color: Colors.white,
                    ),
                  ),
                )
              : SizedBox.expand(

                  child: FittedBox(
                    child: card.icon,
                  ),
                ),
        ),
      ),
    );
  }
}
