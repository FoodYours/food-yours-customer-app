// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/fy_outline_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/search/controller/filter_screen_controller.dart';
import 'package:food_yours_customer/search/widget/filter_category_options.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class FilterScreen extends StatelessWidget {
  final FilterScreenController widgetController =
      Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(
              preferredSize: Size(Dimens.k20, sh(Dimens.k46_41)),
              child: PrimaryAppBar(title: "Filter")),
          body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: sw(Dimens.k24), vertical: sh(Dimens.k24)),
            children: [
              Mulish700Text(
                text: "Filter Tags",
                fontSize: sh(Dimens.k24),
              ),
              SizedBox(
                height: sh(Dimens.k16),
              ),
              Mulish700Text(
                text: "Categories",
                fontSize: sh(Dimens.k16),
              ),
              Obx(
                () => FilterListItem(
                  listItems: foodCategories,
                  onSelected: widgetController.onCategorySelected,
                  selectedIndex: widgetController.selectedCategoryIndex.value,
                ),
              ),
              Divider(
                thickness: 0.5,
                height: sh(Dimens.k24),
              ),
              Mulish700Text(
                text: "Chef Ratings",
                fontSize: sh(Dimens.k16),
              ),
              Obx(
                () => FilterListItem(
                  listItems: widgetController.ratings.value,
                  onSelected: widgetController.onRatingSelected,
                  selectedIndex: widgetController.selectedRatingIndex.value,
                ),
              ),
              Divider(
                thickness: 0.5,
                height: sh(Dimens.k24),
              ),
              Mulish700Text(
                text: "Pricing",
                fontSize: sh(Dimens.k16),
              ),
              Obx(
                () => FilterListItem(
                  listItems: widgetController.pricing.value,
                  onSelected: widgetController.onPricingSelected,
                  selectedIndex: widgetController.selectedPricingIndex.value,
                ),
              ),
              Divider(
                thickness: 0.5,
                height: sh(Dimens.k24),
              ),
              Mulish700Text(
                text: "Distance",
                fontSize: sh(Dimens.k16),
              ),
              Obx(
                () => FilterListItem(
                  listItems: widgetController.distanceFilteringOptions.value,
                  onSelected:
                      widgetController.onDistanceFilteringOptionSelected,
                  selectedIndex: widgetController.distanceFilteringOption.value,
                ),
              ),
              Divider(thickness: 0.5, height: sh(24)),
              Mulish700Text(
                text: "Delivery Time",
                fontSize: sh(Dimens.k16),
              ),
              Obx(
                () => FilterListItem(
                  listItems:
                      widgetController.deliveryTimeFilteringOptions.value,
                  onSelected: widgetController.onDeliveryTimeSelected,
                  selectedIndex:
                      widgetController.deliveryTimeFilteringOption.value,
                ),
              ),
              SizedBox(
                height: sh(Dimens.k59),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FYOutlinedButton(
                      text: "Clear",
                      onPressed: () {},
                      // fontSize: sh(16),
                    ),
                  ),
                  SizedBox(
                    width: sw(Dimens.k23),
                  ),
                  Expanded(
                    child: FYTextButton(
                      text: "Apply",
                      onPressed: widgetController.applyCategoryFilter,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
