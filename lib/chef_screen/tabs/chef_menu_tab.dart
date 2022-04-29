// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_card.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/widget/food_category_list.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChefMenuTab extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k22)),
          child: Mulish700Text(
            text: "Food Categories",
            fontSize: sh(Dimens.k16),
          ),
        ),
        SizedBox(height: sh(7)),
        Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k25)),
            child: FoodCategoryList(
              selectedCategoryIndex: widgetCtrl.selectedFoodCategoryIndex.value,
              onCategorySelected: widgetCtrl.onCategorySelected,
              isLoading: widgetCtrl.showSmallLoader.value,
              foodCategories: foodCategories.value,
              itemCount: 3,
            ),
          ),
        ),
        SizedBox(height: sh(Dimens.k40)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k22)),
          child: Mulish700Text(
            text:
                "${widgetCtrl.tags.isNotEmpty ? widgetCtrl.tags.value[0] : ""}",
            fontSize: sh(Dimens.k16),
          ),
        ),
        SizedBox(height: sh(Dimens.k16)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k22)),
          child: ValueListenableBuilder<Box>(
              valueListenable: Hive.box(Strings.CART_BOX).listenable(),
              builder: (context, box, _) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    CartModel cartModel = box.values.firstWhere(
                        (element) =>
                            element.id == widgetCtrl.chefMeals.value[index].id,
                        orElse: () => CartModel());
                    return FoodDetailsCard(
                      widgetCtrl.chefMeals.value[index],
                      cartModel.count,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: sh(Dimens.k24)),
                  itemCount: widgetCtrl.chefMeals.value.length,
                );
              }),
        ),
      ],
    );
  }
}
