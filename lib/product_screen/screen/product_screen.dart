// ignore_for_file: invalid_use_of_protected_member, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/fy_back_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/product_screen/controller/product_screen_controller.dart';
import 'package:food_yours_customer/product_screen/widget/cart_icon.dart';
import 'package:food_yours_customer/product_screen/widget/meal_customisation_options.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/product_screen/widget/food_header.dart';
import 'package:food_yours_customer/product_screen/widget/meal_quantity_customisation_options.dart';
import 'package:food_yours_customer/product_screen/widget/product_tile.dart';
import 'package:food_yours_customer/product_screen/widget/timeline_image.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final ProductScreenController widgetCtrl = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                leadingWidth: sw(Dimens.k80),
                leading: FYBackButton(),
                actions: [
                  CartIcon(
                    animation: widgetCtrl.animation,
                    animationCtrl: widgetCtrl.animationCtrl,
                    onCartPressed: widgetCtrl.gotoOrderSummary,
                  ),
                ],
                expandedHeight: sh(Dimens.k295),
                pinned: true,
                flexibleSpace: Obx(
                  () => TimeLineImage(
                    timelineImage: widgetCtrl.meal.value.mealPic,
                    height: double.infinity,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: sw(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: sh(Dimens.k8)),
                          Obx(
                            () => ProductTitle(
                              meal: widgetCtrl.meal.value,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Entypo.dot_single,
                                color: context.theme.textTheme.headline3!.color,
                              ),
                              Mulish400Text(
                                text: "Scroll down to customize your order",
                                fontSize: sh(Dimens.k12),
                                color: FYColors.mainRed,
                              ),
                            ],
                          ),
                          Divider(
                              color: FYColors.subtleBlack2.withOpacity(0.8),
                              thickness: 0.5),
                          SizedBox(height: sh(Dimens.k32)),
                          Obx(
                            () => Article(
                              title: "Descriptions",
                              description: widgetCtrl.meal.value.description,
                            ),
                          ),
                          SizedBox(height: sh(Dimens.k32)),
                          Obx(
                            () => Article(
                              title: "Ingredients",
                              description: widgetCtrl.meal.value.ingerdients,
                            ),
                          ),
                          SizedBox(height: sh(80)),
                          FoodTableHeader(
                            leading: "Quantity",
                            trailing: "Single option",
                          ),
                          SizedBox(
                            height: sh(Dimens.k16),
                          ),
                          Obx(
                            () => MealCustomizationQuantityOptions(
                                listItems: widgetCtrl.meal.value.allPrices,
                                onSelected: widgetCtrl.onQuantitySelected,
                                selectedItem:
                                    widgetCtrl.selectedQuantity.value),
                          ),
                          Divider(
                            thickness: 0.4,
                            height: 0,
                          ),
                          SizedBox(
                            height: sh(Dimens.k32),
                          ),
                          FoodTableHeader(
                              leading: "Supplements",
                              trailing: "Select up to 4 options"),
                          SizedBox(height: sh(Dimens.k16)),
                          Obx(
                            () => MealCustomizationOptions(
                              listItems: widgetCtrl.meal.value.suppliments,
                              onSelected: widgetCtrl.onSupplementSelected,
                              selectedItems:
                                  widgetCtrl.selectedSupplements.value,
                            ),
                          ),
                          Divider(
                            thickness: 0.4,
                            height: 0,
                          ),
                          SizedBox(
                            height: sh(Dimens.k32),
                          ),
                          FoodTableHeader(
                              leading: "Extras",
                              trailing: "Select up to 2 options"),
                          SizedBox(height: sh(Dimens.k16)),
                          Obx(
                            () => MealCustomizationOptions(
                                listItems: widgetCtrl.meal.value.extras,
                                onSelected: widgetCtrl.onExtrasSelected,
                                selectedItems: widgetCtrl.selectedExtras.value),
                          ),
                          Divider(
                            thickness: 0.4,
                            height: 0,
                          ),
                          SizedBox(
                            height: sh(Dimens.k32),
                          ),
                          Mulish600Text(
                            text: "Extra Instructions",
                            color: FYColors.darkerBlack7,
                            fontSize: sh(Dimens.k14),
                          ),
                          SizedBox(
                            height: sh(7.0),
                          ),
                          SecondaryTextField(
                            keyboardType: TextInputType.multiline,
                            controller: widgetCtrl.noteTextController,
                            hintText:
                                "Please indicate any allergies or specifications",
                            maxLines: 8,
                          ),
                          SizedBox(
                            height: sh(24.0),
                          ),
                          FYTextButton(
                            text: "Add to cart",
                            onPressed: widgetCtrl.addToCart,
                          ),
                          SizedBox(
                            height: sh(Dimens.k20),
                          ),
                        ],
                      ),
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
}
