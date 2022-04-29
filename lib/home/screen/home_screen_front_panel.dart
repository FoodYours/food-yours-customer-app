// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/controller/home_tab_front_panel_controller.dart';
import 'package:food_yours_customer/home/widget/ad_space.dart';
import 'package:food_yours_customer/home/widget/food_category_list.dart';
import 'package:food_yours_customer/home/widget/large_order_banner.dart';
import 'package:food_yours_customer/home/widget/popular_chefs_list.dart';
import 'package:food_yours_customer/home/widget/large_order_banner_loading_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class HomeScreenFrontPanel extends StatelessWidget {
  final HomeTabFrontPanelController homeTabFrontPanelCrtl =
      Get.put(HomeTabFrontPanelController());
  final HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: ListView(padding: EdgeInsets.zero, children: [
        SizedBox(
          height: sh(Dimens.k10_59),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k25)),
          child: Mulish700Text(
            text: "Food Categories",
            fontSize: Dimens.k16,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k25)),
            child: FoodCategoryList(
              selectedCategoryIndex:
                  homeTabCrtl.selectedFoodCategoryIndex.value,
              onCategorySelected: homeTabCrtl.onCategorySelected,
              isLoading: homeTabCrtl.isLoadingFoodCategories.value,
              foodCategories: foodCategories.value,
            ),
          ),
        ),
        SizedBox(
          height: sh(Dimens.k16),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k25)),
          child: Mulish700Text(
            text: "Popular chefs around you",
            fontSize: Dimens.k16,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Obx(
          () => PopularChefList(
            isLoading: homeTabCrtl.isLoadingFoodCategories.value,
            popularChefs: homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value,
            onChefSelected: homeTabCrtl.onChefSelected,
          ),
        ),
        SizedBox(
          height: sh(15.82),
        ),
        Container(
          child: AdSpace(/* widgetCrtl.homeTabCrtl.openAlertDialog */),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: sw(24)),
        ),
        SizedBox(
          height: sh(Dimens.k13),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(25)),
          child: Mulish700Text(
            text: "Top chefs in your city",
            fontSize: Dimens.k16,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Obx(
          () => PopularChefList(
            isLoading: homeTabCrtl.isLoadingFoodCategories.value,
            popularChefs: homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value,
            onChefSelected: homeTabCrtl.onChefSelected,
          ),
        ),
        SizedBox(
          height: sh(35.82),
        ),
        Obx(
          () => Container(
            child: homeTabCrtl.isLoadingFoodCategories.value
                ? LargeOrderBannerLoadingItem()
                : LargeOrderBanner(),
            width: sw(Dimens.k327),
          ),
        ),
        SizedBox(
          height: sh(28),
        ),
      ]),
    );
  }
}
