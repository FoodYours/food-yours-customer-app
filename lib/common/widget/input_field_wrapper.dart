import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class InputFieldWrapper extends StatelessWidget {
  final String labelText;
  final Widget child;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final double? spaceBetween;

  InputFieldWrapper({
    this.labelText = "",
    required this.child,
    this.spaceBetween,
    this.labelColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Mulish600Text(
          text: labelText,
          fontSize: sh(Dimens.k12),
          color: FYColors.lighterBlack2,
        ),
        SizedBox(height: sh(spaceBetween ?? sh(2))),
        child,
      ],
    );
  }
}
