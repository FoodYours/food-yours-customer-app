import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  final Color valueTextColor;

  const KeyValueText({
    Key? key,
    required this.keyText,
    required this.valueText,
    this.valueTextColor = FYColors.darkerBlack2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Mulish600Text(
          text: keyText,
          fontSize: Dimens.k12,
          color: FYColors.lighterBlack2,
        ),
        Mulish600Text(
          text: valueText,
          fontSize: Dimens.k12,
          color: valueTextColor,
        ),
      ],
    );
  }
}
