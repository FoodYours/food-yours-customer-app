import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/auto_complete_input_field.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/home/controller/home_tab_back_panel_controller.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_list.dart';
import 'package:food_yours_customer/home/widget/fy_chip.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenBackPanel extends StatelessWidget {
  final HomeTabBackPanelController homeTabBackPanelCrtl =
      Get.put(HomeTabBackPanelController());
  final HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: homeTabBackPanelCrtl.isLoadingMeal.value,
        message: homeTabBackPanelCrtl.loadingMessage.value,
        child: Container(
          color: FYColors.subtleBlack5,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sh(Dimens.k28)),
                    Row(
                      children: [
                        Expanded(
                          child: AutoCompleteInputField<MealSearchViewModel>(
                            onSelected: homeTabBackPanelCrtl.onSelected,
                            suggestionsCallback:
                                homeTabBackPanelCrtl.loadMealSuggestions,
                            searchQueryTextController:
                                homeTabBackPanelCrtl.searchQueryTextController,
                            hintText: "Enter food name",
                          ),
                        ),
                        SizedBox(width: sw(14.67)),
                        FYButton(
                          child: SvgPicture.asset(Images.settings,
                              width: sw(26.67), height: sh(30.01)),
                          onTap: homeTabBackPanelCrtl.gotoFilterScreen,
                        ),
                      ],
                    ),
                    SizedBox(height: sh(Dimens.k20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Mulish600Text(
                          text: "Recent Searches",
                          fontSize: Dimens.k16,
                          color: FYColors.lighterBlack2,
                        ),
                        SizedBox(width: sw(Dimens.k9)),
                        FYFlatButton(
                          size: Size(Dimens.k0, Dimens.k0),
                          backgroundColor: Colors.transparent,
                          onPressed: homeTabBackPanelCrtl.clearSearchInputField,
                          child: Mulish600Text(
                            text: "Clear",
                            fontSize: Dimens.k12,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sh(Dimens.k11)),
                    ValueListenableBuilder<Box>(
                      valueListenable:
                          Hive.box(Strings.SEARCH_HISTORY_BOX).listenable(),
                      builder: (context, box, _) {
                        return Wrap(
                          children: List.generate(
                            box.values.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: Dimens.k8),
                              child: FYChip(box.getAt(index),
                                  hideDeleteButton: false,
                                  onDeleted: () => homeTabBackPanelCrtl
                                      .onDeleteResentSearch(index)),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: sh(Dimens.k50)),
                    Text("Food Categories",
                        style: context.theme.textTheme.headline5!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: sh(Dimens.k8)),
                  ],
                ),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k22)),
                  child: FoodCategoryList(
                    selectedCategoryIndex:
                        homeTabCrtl.selectedFoodCategoryIndex.value,
                    onCategorySelected: homeTabCrtl.onCategorySelected,
                    isLoading: homeTabCrtl.isLoadingFoodCategories.value,
                    foodCategories: foodCategories,
                    itemCount: foodCategories.length,
                  ),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
