import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';

class FYDottedLine extends StatelessWidget {
  const FYDottedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: Dimens.k0_5,
      dashLength: Dimens.k12,
      dashColor: FYColors.subtleBlue4,
      dashRadius: Dimens.k0,
      dashGapLength: Dimens.k2,
      dashGapColor: Colors.transparent,
      dashGapRadius: Dimens.k0,
    );
  }
}
