import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProgressTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Container(
      child: Row(
        children: [
          SizedBox(
            height: sh(86),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Images.success_check),
                        SizedBox(
                          height: sh(62),
                          child: VerticalDivider(thickness: 1.5, endIndent: 0),
                        )
                      ],
                    ),
                    SizedBox(width: 14.0),
                    ProgressIndicatorText()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressIndicatorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return SizedBox(
      height: sh(86),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Order Placed",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: Dimens.k12,
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack2),
          ),
          Text(
            "28/05/2021   3:45PM",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: Dimens.k12,
                fontWeight: FontWeight.w400,
                color: FYColors.darkerBlack),
          ),
        ],
      ),
    );
  }
}
