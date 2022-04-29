// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_review_card.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ChefReviewTab extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());
  ChefReviewTab() {
    widgetCtrl.loadChefReviews();
  }
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sw(Dimens.k24), vertical: sh(Dimens.k32)),
          child: Obx(
            () => ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  ChefReviewCard(widgetCtrl.chefReviews.value[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: sh(Dimens.k24)),
              itemCount: widgetCtrl.chefReviews.value.length,
            ),
          ),
        ),
        SizedBox(
          height: sh(Dimens.k150),
        ),
      ],
    );
  }
}
