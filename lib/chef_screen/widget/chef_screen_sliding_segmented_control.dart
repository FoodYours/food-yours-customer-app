import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/widget/fy_sliding_segmented_control.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ChefScreenSlidingSegmentedControl extends StatelessWidget {
  final int selectedSegment;
  final Function(dynamic) onSegmentSelected;

  const ChefScreenSlidingSegmentedControl({
    Key? key,
    required this.selectedSegment,
    required this.onSegmentSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sw = sWidth(context);

    return SizedBox(
      width: sw(Dimens.k326),
      child: FYSlidingSegmentedControl(
        labels: {
          1: Mulish700Text(
            text: "Menu",
            fontSize: Dimens.k12,
            color: selectedSegment == 1
                ? FYColors.darkerBlack2
                : FYColors.lighterBlack2,
          ),
          2: Mulish700Text(
            text: "Reviews",
            fontSize: Dimens.k12,
            color: selectedSegment == 2
                ? FYColors.darkerBlack2
                : FYColors.lighterBlack2,
          ),
          3: Mulish700Text(
            text: "Chef info",
            fontSize: Dimens.k12,
            color: selectedSegment == 2
                ? FYColors.darkerBlack2
                : FYColors.lighterBlack2,
          ),
        },
        onChanged: onSegmentSelected,
        selectedSegment: selectedSegment,
      ),
    );
  }
}
