import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYOutlinedButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function()? onPressed;
  final Size size;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const FYOutlinedButton({
    Key? key,
    required this.text,
    this.size = const Size(double.infinity, Dimens.k56),
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.textSize = Dimens.k14,
    this.borderColor = FYColors.lighterBlack2,
    this.textColor = FYColors.lighterBlack2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return OutlinedButton(
      onPressed: onPressed,
      child: Mulish400Text(
        text: text,
        color: textColor,
        fontSize: sh(textSize),
      ),
      style: context.theme.outlinedButtonTheme.style!.copyWith(
        minimumSize: MaterialStateProperty.all<Size>(size),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor, width: Dimens.k1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }
}
