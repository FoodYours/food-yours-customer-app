import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/common/widget/text/inter_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/view_model/chef_review_view_modal.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:intl/intl.dart';

class ChefReviewCard extends StatelessWidget {
  final ChefReviewViewModel chefReviewViewModel;
  ChefReviewCard(this.chefReviewViewModel);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: FYRaisedCard(
        padding: EdgeInsets.only(
            left: sw(16), right: sw(13), top: sh(16), bottom: sh(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: sh(40),
                    width: sw(40),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.anonymous_chef_reviewer,
                      image: chefReviewViewModel.userImage,
                      imageErrorBuilder: (BuildContext context, Object object,
                          StackTrace? stacktrace) {
                        return SvgPicture.asset(
                          Images.anonymous_chef_reviewer,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: sw(12)),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Mulish700Text(
                              text: chefReviewViewModel.userName,
                              fontSize: sh(Dimens.k16),
                            ),
                            Row(
                                children: List.generate(
                              5,
                              (int index) => Icon(FYIcons.star,
                                  size: Dimens.k16,
                                  color: index <=
                                          int.parse(
                                              chefReviewViewModel.userRating)
                                      ? FYColors.mainOrange
                                      : FYColors.subtleBlack2),
                            ))
                          ]),
                      Inter400Text(
                        text:
                            "${DateFormat("d/M/yyyy").format(DateFormat("yyyy-MM-dd HH:mm:ss").parse("2021-06-19 08:59:19")) /* DateTime.parse("2021-06-19 08:59:19.000000") */}",
                        color: FYColors.lighterBlack3,
                        fontSize: sh(Dimens.k12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Dimens.k240,
              child: Inter400Text(
                  text: "${chefReviewViewModel.userRemark}",
                  fontSize: sh(Dimens.k12)),
            ),
          ],
        ),
      ),
    );
  }
}
