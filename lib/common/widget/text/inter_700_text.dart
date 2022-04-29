import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class Inter700Text extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final TextDecoration textDecoration;

  const Inter700Text({
    Key? key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontSize = Dimens.k20,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Text(
      text,
      textAlign: textAlign,
      style: context.theme.textTheme.bodyText2!.copyWith(
        color: color,
        fontSize: sh(fontSize),
        decoration: textDecoration,
      ),
    );
  }
}
