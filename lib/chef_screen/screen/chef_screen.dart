// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_info_tab.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_menu_tab.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_review_tab.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_profile_card.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_screen_title.dart';
import 'package:food_yours_customer/common/widget/fy_back_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/loading_gif.dart';
import 'package:food_yours_customer/product_screen/widget/cart_icon.dart';
import 'package:food_yours_customer/product_screen/widget/timeline_image.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ChefScreen extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.showLargeLoader.value,
        message: widgetCtrl.loadingMessage.value,
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          body: CustomScrollView(
            controller: widgetCtrl.scrollController,
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                leadingWidth: sw(Dimens.k80),
                leading: FYBackButton(),
                title: Obx(
                  () => ChefScreenTitle(
                    chefName: widgetCtrl.chef.value.chefName,
                    rating: widgetCtrl.chef.value.rating,
                  ),
                ),
                actions: [
                  CartIcon(
                    animation: widgetCtrl.animation,
                    animationCtrl: widgetCtrl.animationCtrl,
                    onCartPressed: widgetCtrl.gotoOrderSummary,
                  ),
                ],
                expandedHeight: sh(Dimens.k262),
                pinned: true,
                flexibleSpace: Obx(
                  () => TimeLineImage(
                    timelineImage: widgetCtrl.chefMeals.length > 0
                        ? widgetCtrl.chefMeals.value.first.mealImage
                        : "",
                    chefImage: widgetCtrl.chef.value.chefImage,
                    height: Dimens.k222,
                    filterColor: Colors.black.withOpacity(0.75),
                    blendMode: BlendMode.darken,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ChefProfileCard(),
                    Obx(
                      () => buildChefTab(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChefTab() {
    if (widgetCtrl.selectedTab.value == 1 &&
        widgetCtrl.showSmallLoader.value == false) {
      return ChefMenuTab();
    } else if (widgetCtrl.selectedTab.value == 2 &&
        widgetCtrl.showSmallLoader.value == false) {
      return ChefReviewTab();
    } else if (widgetCtrl.selectedTab.value == 3 &&
        widgetCtrl.showSmallLoader.value == false) {
      return ChefInfoTab();
    } else {
      return LoadingGif();
    }
  }
}
