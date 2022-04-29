// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_quantity_control.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodDetailsCard extends StatelessWidget {
  final MealSearchViewModel mealSearchViewModel;
  final int count;

  FoodDetailsCard(this.mealSearchViewModel, this.count);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYRaisedCard(
      padding: EdgeInsets.only(
        left: sw(Dimens.k9),
        right: sw(Dimens.k9),
        top: sh(Dimens.k7_63),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.k8),
                  child: FadeInImage.assetNetwork(
                    height: sh(Dimens.k124),
                    width: double.infinity,
                    placeholder: Images.popular_chef,
                    image: mealSearchViewModel.mealImage,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (c, o, t) => Image.asset(
                      Images.popular_chef,
                      height: sh(Dimens.k124),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sh(Dimens.k17_16),
            ),
            Article(
              descriptionFontSize: Dimens.k12,
              title: "${mealSearchViewModel.name}",
              description:
                  "A meal of pounded yam and melon soup, a traditional meal for the yorubas in the western part of Nigeria..",
            ),
            SizedBox(
              height: sh(Dimens.k17),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  style: context.theme.textTheme.headline3!.copyWith(
                    color: FYColors.darkerBlack,
                    fontSize: sh(Dimens.k12),
                  ),
                  text: "From  ",
                ),
                TextSpan(
                  style: context.theme.textTheme.headline3!.copyWith(
                    color: FYColors.mainRed,
                    fontSize: sh(Dimens.k16),
                  ),
                  text: "N${mealSearchViewModel.lowestPrice}",
                ),
              ]),
            ),
            SizedBox(
              height: sh(Dimens.k4_47),
            ),
            Divider(
              thickness: 0.5,
              height: 0,
            ),
            SizedBox(
              height: sh(Dimens.k5_67),
            ),
            Container(
              height: sh(Dimens.k34_74),
              child: FoodDetailQuantityControl(
                mealSearchViewModel,
                count,
              ),
            ),
            SizedBox(
              height: sh(Dimens.k16_21),
            ),
          ],
        ),
      ),
    );
  }
}
