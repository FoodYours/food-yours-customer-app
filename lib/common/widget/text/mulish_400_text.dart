import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class Mulish400Text extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;
  final TextOverflow overflow;
  final int maxLines;

  const Mulish400Text({
    Key? key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontSize = Dimens.k16,
    this.textDecoration = TextDecoration.none,
    this.fontStyle = FontStyle.normal,
    this.overflow: TextOverflow.ellipsis,
    this.maxLines: 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.theme.textTheme.headline2!.copyWith(
        color: color,
        overflow: overflow,
        fontSize: sh(fontSize),
        decoration: textDecoration,
        fontStyle: fontStyle,
      ),
    );
  }
}
