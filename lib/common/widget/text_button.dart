import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';

class FYTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextDecoration decoration;
  final double? fontSize;
  final FontStyle fontStyle;

  const FYTextButton({
    required this.text,
    this.onPressed,
    this.decoration = TextDecoration.none,
    this.fontSize,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: context.theme.textTheme.button!.copyWith(
          fontSize: sh(fontSize ?? Dimens.k16),
          fontStyle: fontStyle,
          decoration: decoration,
        ),
      ),
    );
  }
}
