// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_label.dart';
import 'package:food_yours_customer/home/widget/rating.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PopularChefItem extends StatelessWidget {
  final PopularChefViewModel popularChef;
  final Function(PopularChefViewModel value)? onChefSelected;

  PopularChefItem(
    this.popularChef, {
    this.onChefSelected,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYFlatButton(
      onPressed: onChefSelected == null ? null : () => onChefSelected,
      size: Size(0, 0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9.85),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.63), BlendMode.darken),
              child: FadeInImage.assetNetwork(
                placeholder: Images.popular_chef,
                image: popularChef.popularChefImagePath,
                height: sh(Dimens.k141_18),
                width: sh(Dimens.k142),
                fit: BoxFit.cover,
                imageErrorBuilder: (c, o, t) => Image.asset(
                  Images.popular_chef,
                  height: sh(Dimens.k141_18),
                  width: sh(Dimens.k142),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: sh(11.08)),
            Container(
                child: buildFoodCategoryAndStartPriceWidget(context, sh, sw),
                width: sh(132.82)),
            SizedBox(height: sh(58.5)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: sw(7.82)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNameAddressWidget(context, sh, sw),
                  Container(
                    child: buildAvailableDaysAndRatingWidget(context, sh, sw),
                  ),
                ],
              ),
            ),
            SizedBox(width: sw(Dimens.k7)),
          ]),
        ],
      ),
    );
  }

  Column buildNameAddressWidget(
      BuildContext context, Function sh, Function sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Mulish700Text(
          text: popularChef.chefName,
          fontSize: sh(Dimens.k12),
          color: Colors.white,
        ),
        SizedBox(
          width: sw(Dimens.k7),
        ),
        Mulish600Text(
          text: popularChef.kitchenAddress,
          fontSize: sh(Dimens.k10),
          color: FYColors.subtleBlack3,
        ),
        SizedBox(
          width: sw(Dimens.k7),
        ),
      ],
    );
  }

  Widget buildAvailableDaysAndRatingWidget(
      BuildContext context, Function sh, Function sw) {
    return Container(
      width: sh(125),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Mulish600Text(
                text: "DD: ",
                color: FYColors.subtleBlack3,
                fontSize: Dimens.k10,
              ),
              Text("",
                  maxLines: 1,
                  style: context.theme.textTheme.button!.copyWith(
                      fontSize: sh(Dimens.k10), fontWeight: FontWeight.w600)),
            ],
          ),
          Rating(popularChef.ratings)
        ],
      ),
    );
  }

  Row buildFoodCategoryAndStartPriceWidget(
      BuildContext context, Function sh, Function sw) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardStrip(
            stripeText: Wrap(
              children: [
                AutoSizeText(
                  popularChef.foodCategory,
                  minFontSize: 8,
                  style: context.theme.textTheme.headline3!
                      .copyWith(fontSize: sh(Dimens.k9_85)),
                ),
              ],
            ),
            height: sh(Dimens.k16_42),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Mulish400Text(
                text: "Starting at:",
                color: FYColors.subtleBlack3,
                fontSize: sh(Dimens.k10),
              ),
              Mulish700Text(
                text: "N 4,000",
                fontSize: sh(Dimens.k10),
                color: Colors.white,
              )
            ],
          ),
        ]);
  }
}
