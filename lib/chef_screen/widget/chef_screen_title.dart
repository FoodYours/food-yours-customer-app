import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/text/inter_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_800_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ChefScreenTitle extends StatelessWidget {
  final String rating;
  final String chefName;

  const ChefScreenTitle({
    Key? key,
    required this.rating,
    required this.chefName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Column(
      children: [
        Mulish800Text(
          text: "${chefName.split(".").first}’s kitchen!",
          fontSize: Dimens.k16,
          color: Colors.white,
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Inter400Text(
              text: "Chef Ratings: ",
              fontSize: Dimens.k12,
              color: Colors.white.withOpacity(0.4),
            ),
            SvgPicture.asset(
              Images.star,
              width: Dimens.k16,
              height: Dimens.k16,
            ),
            Inter400Text(
              text: "${rating}",
              fontSize: Dimens.k12,
              color: Colors.white,
            ),
            Inter400Text(
              text: "(22)",
              fontSize: Dimens.k12,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
