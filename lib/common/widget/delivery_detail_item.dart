import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class DeliveryDetailItem extends StatelessWidget {
  final String leading;
  final String title;
  final Widget? titleWidget;

  const DeliveryDetailItem({
    Key? key,
    this.leading = "",
    this.title = "",
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Mulish400Text(
            text: leading,
            fontSize: sh(Dimens.k12),
          ),
        ),
        Expanded(
          flex: 3,
          child: titleWidget ??
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Mulish600Text(
                  text: title,
                  fontSize: sh(Dimens.k12),
                  color: FYColors.darkerBlack2,
                ),
              ),
        ),
      ],
    );
  }
}
