import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/common/widget/button/fy_svg_button.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/instance_manager.dart';

class FoodDetailQuantityControl extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());
  final int count;
  final MealSearchViewModel mealSearchViewModel;

  FoodDetailQuantityControl(this.mealSearchViewModel, this.count);

  @override
  Widget build(BuildContext context) {
    Function sw = sWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FYSvgButton(
                  onPressed: () =>
                      widgetCtrl.removeItemFromCart(mealSearchViewModel),
                  svgPicture: Images.minus_circle,
                ),
                SizedBox(
                  width: sw(19.6),
                ),
                Mulish400Text(
                  text: count.toString(),
                  fontSize: 15.25,
                ),
                SizedBox(
                  width: sw(21.13),
                ),
                FYSvgButton(
                  onPressed: () =>
                      widgetCtrl.addItemToCart(mealSearchViewModel),
                  svgPicture: Images.plus_circle,
                ),
              ],
            ),
          ],
        ),
        VerticalDivider(
          thickness: 0.19,
          color: Colors.black,
          endIndent: 10,
        ),
        Expanded(
          flex: 2,
          child: FYTextButton(
            text: "Details",
            size: Size(Dimens.k0, Dimens.k0),
            backgroundColor: Colors.transparent,
            textColor: FYColors.mainBlue,
            textDecoration: TextDecoration.underline,
            onPressed: () => widgetCtrl.loadMeal(mealSearchViewModel),
          ),
        ),
      ],
    );
  }
}
