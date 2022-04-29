// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_svg_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/search/controller/search_screen_controller.dart';
import 'package:food_yours_customer/search/widget/found_items_text.dart';
import 'package:food_yours_customer/search/widget/search_results_list.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController widgetCtrl = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Container(
          color: context.theme.backgroundColor,
          child: SafeArea(
            child: Scaffold(
              appBar: PrimaryAppBar(
                title: "Search",
                elevation: 0,
              ),
              body: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sw(Dimens.k24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sh(Dimens.k26),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryTextField(
                            prefixIcon: Icon(FYIcons.search),
                            hintText: "Enter food name",
                            controller: widgetCtrl.searchTextEditingController,
                          ),
                        ),
                        SizedBox(
                          width: sw(14.67),
                        ),
                        FYSvgButton(
                          svgPicture: Images.settings,
                          svgSize: Dimens.k40,
                          onPressed: widgetCtrl.gotoFilterScreen,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sh(Dimens.k24),
                    ),
                    Obx(
                      () => FoundItemsText(
                        mealsCount: widgetCtrl.mealsCount.value,
                        searchText: widgetCtrl.searchTextEditingController.text,
                      ),
                    ),
                    SizedBox(
                      height: sh(Dimens.k12),
                    ),
                    Expanded(
                      child: Obx(
                        () => SearchResultsList(
                          mealViewModels: widgetCtrl.meals.value,
                          onChefSelected: widgetCtrl.onChefSelected,
                          onMealSelected: widgetCtrl.onMealSelected,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
