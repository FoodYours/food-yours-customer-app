import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoundItemsText extends StatelessWidget {
  final int mealsCount;
  final String searchText;

  const FoundItemsText({
    Key? key,
    required this.mealsCount,
    required this.searchText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Wrap(
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: context.theme.textTheme.headline3!.copyWith(
                  color: FYColors.lighterBlack2,
                  fontSize: sh(Dimens.k12),
                ),
                text: "${mealsCount} menu items found on ",
              ),
              TextSpan(
                style: context.theme.textTheme.headline3!.copyWith(
                  color: FYColors.darkerBlack2,
                  fontSize: sh(Dimens.k12),
                ),
                text: searchText,
              ),
              TextSpan(
                style: context.theme.textTheme.headline3!.copyWith(
                  color: FYColors.lighterBlack2,
                  fontSize: sh(Dimens.k12),
                ),
                text: " around",
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Mulish600Text(
              color: FYColors.lighterBlack2,
              fontSize: Dimens.k12,
              text: "your location. Change location",
            ),
            FYButton(
              padding: Dimens.k4,
              child: Mulish600Text(
                color: FYColors.mainBlue,
                fontSize: Dimens.k12,
                text: "here",
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
