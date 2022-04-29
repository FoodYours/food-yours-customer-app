import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_screen_sliding_segmented_control.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/text/inter_500_text.dart';
import 'package:food_yours_customer/common/widget/text/inter_700_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/home/widget/food_yours_chip.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class ChefProfileCard extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.find<ChefScreenController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            boxShadow: widgetCtrl.selectedTab.value > 1
                ? null
                : [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 1))
                  ]),
        child: Column(
          children: [
            Inter500Text(
              text: "${widgetCtrl.chef.value.chefName}",
              textAlign: TextAlign.center,
              fontSize: Dimens.k24,
            ),
            SizedBox(height: sh(Dimens.k8)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sw(Dimens.k22),
                  ),
                  child: Wrap(
                    children: List.generate(
                      widgetCtrl.tags.length,
                      (index) => FoodYoursChip(
                        text: widgetCtrl.tags[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: sh(Dimens.k12)),
            Mulish400Text(
              text: "Cheapest Dish(minimum):",
              fontSize: sh(Dimens.k12),
            ),
            SizedBox(height: sh(Dimens.k4)),
            Inter700Text(
              text: "N 4,000",
              fontSize: Dimens.k24,
            ),
            SizedBox(
              height: sh(Dimens.k8),
            ),
            Mulish400Text(
              text: "Delivery Time:",
              fontSize: Dimens.k12,
            ),
            Inter700Text(
              text: "32hrs",
              fontSize: Dimens.k24,
            ),
            SizedBox(height: sh(Dimens.k16)),
            Obx(
              () => FYTextButton(
                text: "Follow Chef",
                onPressed: widgetCtrl.toggleFollowingStatus,
                backgroundColor: widgetCtrl.isFollowed.value
                    ? FYColors.subtleGreen1
                    : FYColors.subtleBlue2,
                textColor: widgetCtrl.isFollowed.value
                    ? FYColors.mainGreen
                    : FYColors.mainBlue,
                size: Size(Dimens.k141, Dimens.k47),
              ),
            ),
            SizedBox(height: sh(Dimens.k8)),
            Text("*You get notified when chef add new menu items",
                style: context.theme.textTheme.headline4!
                    .copyWith(fontSize: sh(Dimens.k12))),
            SizedBox(height: sh(Dimens.k24)),
            Obx(
              () => ChefScreenSlidingSegmentedControl(
                selectedSegment: widgetCtrl.selectedTab.value,
                onSegmentSelected: widgetCtrl.onSegmentSelected,
              ),
            ),
            SizedBox(height: sh(Dimens.k17)),
          ],
        ),
      ),
    );
  }
}
