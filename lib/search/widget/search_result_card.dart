// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_label.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/search/widget/chef_circular_image.dart';
import 'package:food_yours_customer/search/widget/chef_name_and_rating_column.dart';
import 'package:food_yours_customer/search/widget/delivery_days_text.dart';
import 'package:food_yours_customer/search/widget/product_name_and_price_column.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class SearchResultCard extends StatelessWidget {
  final MealSearchViewModel mealViewModel;
  final Function(MealSearchViewModel)? onChefSelected;
  final Function(MealSearchViewModel)? onMealSelected;

  SearchResultCard({
    required this.mealViewModel,
    required this.onChefSelected,
    required this.onMealSelected,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: FYColors.subtleBlack6, width: 0.4),
              borderRadius: BorderRadius.circular(Dimens.k12)),
          padding: EdgeInsets.only(
            left: sw(Dimens.k12),
            right: sw(Dimens.k12),
            top: sh(Dimens.k12),
          ),
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  FYFlatButton(
                    onPressed: onChefSelected == null
                        ? null
                        : () => onMealSelected!(mealViewModel),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.k8),
                      child: FadeInImage.assetNetwork(
                        height: sh(Dimens.k124),
                        width: sw(Dimens.k303),
                        placeholder: Images.search_result,
                        image: mealViewModel.mealImage,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (c, o, t) => Image.asset(
                          Images.search_result,
                          height: sh(Dimens.k124),
                          width: sw(Dimens.k303),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -sh(Dimens.k16),
                    right: sw(Dimens.k8),
                    child: FYFlatButton(
                      child: ChefCircularImage(
                        chefImage: mealViewModel.chefImage,
                      ),
                      size: Size(Dimens.k48, Dimens.k48),
                      backgroundColor: Colors.transparent,
                      onPressed: onChefSelected == null
                          ? null
                          : () => onChefSelected!(mealViewModel),
                    ),
                  ),
                  Positioned(
                    top: sh(Dimens.k11),
                    left: -sw(Dimens.k6),
                    child: CardStrip(
                      stripeText: Wrap(
                        children: [
                          DeliveryDaysText(
                            deliveryDays: mealViewModel.deliveryDays,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh(Dimens.k12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: ProductNameAndPriceColumn(
                      mealViewModel: mealViewModel,
                    ),
                  ),
                  Expanded(
                    child:
                        ChefNameAndRatingColumn(mealViewModel: mealViewModel),
                  ),
                ],
              ),
              SizedBox(
                height: sh(Dimens.k8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
