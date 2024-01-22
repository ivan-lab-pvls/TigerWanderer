import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/theme/theme_helper.dart';

class GameTimerMobile extends StatelessWidget {
  const GameTimerMobile({
    required this.time,
    super.key,
  });

  final Duration time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 13.v, horizontal: 8.h),
            decoration: BoxDecoration(
              color: appTheme.mainOrange,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft:  Radius.circular(10)),

            ),
            child: Text(
                textAlign: TextAlign.center,
                'Time',
                style: theme.textTheme.titleLarge),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 13.v, horizontal: 8.h),
            decoration: BoxDecoration(
              color: appTheme.sandy,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight:  Radius.circular(10)),
             
            ),
            child: Text(
                textAlign: TextAlign.center,
                _formatDuration(time),
                style: theme.textTheme.titleLarge),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
