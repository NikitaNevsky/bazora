import "package:flutter/material.dart";

import 'package:bazora/core/utils/app_colors.dart';

import 'package:bazora/core/utils/utils.dart';


/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.type = false,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.ac_unit,
      color: Color(0x15000000),
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = AppColors.white,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    this.leftIcon,
    this.title,
  }) : super(key: key);

  const CustomSnackBar.info({
    Key? key,
    this.type = false,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    this.leftIcon,
    this.title,
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.type = false,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = Colors.white,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    this.leftIcon = false,
    this.title
  }) : super(key: key);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final bool type;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;
  final bool? leftIcon;
  final String? title;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // clipBehavior: Clip.hardEdge,
      // height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: (widget.leftIcon ?? false) ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 40,
          //   width: 40,
          //   child: widget.icon,
          // ),
          if (widget.leftIcon ?? false)
            const SizedBox()
          else
            Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: AppUtils.kPaddingAll8,
            decoration: BoxDecoration(
              color: widget.type ? const Color(0xff26BD6C).withOpacity(0.15) : const Color(0xffE6483D).withOpacity(0.15),
              borderRadius: AppUtils.kBorderRadius12
            ),
            child: widget.icon,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.title?.isNotEmpty ?? false) Text(
                    widget.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(decoration: TextDecoration.none, color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 15),
                  )
                else
                  const SizedBox(),
                AppUtils.kGap4,
                Text(
                  widget.message,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  style: const TextStyle(decoration: TextDecoration.none, color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
