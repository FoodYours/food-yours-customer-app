// ignore_for_file: invalid_use_of_protected_member

import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/notification/screen/notification_screen.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/search/screen/search_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class FilterScreenController extends GetxController {
  RxList<MealSearchViewModel> meals = <MealSearchViewModel>[].obs;
  RxList<MealSearchViewModel> filteredMeals = <MealSearchViewModel>[].obs;

  RxList<FYOptionItem> ratings =
      RxList.generate(4, (int i) => FYOptionItem("${++i} Star Chefs", ++i))
          .reversed
          .toList()
          .obs;

  RxList<FYOptionItem> pricing = <FYOptionItem>[
    FYOptionItem("Low to High", Integers.LOWEST_TO_HIGHEST_PRICE),
    FYOptionItem("High to Low", Integers.HIGHEST_TO_LOWEST_PRICE),
  ].obs;

  RxList<FYOptionItem> distanceFilteringOptions = <FYOptionItem>[
    FYOptionItem("Closest to Farthest", Integers.CLOSEST_TO_FARTHEST),
    FYOptionItem("Farthest to Closest", Integers.FARTHEST_TO_CLOSEST),
  ].obs;

  RxList<FYOptionItem> deliveryTimeFilteringOptions = [
    FYOptionItem("Less than 48hrs", Integers.LESS_THAN_48_HOURS),
    FYOptionItem("48hrs or more", Integers.MORE_THAN_48_HOURS),
  ].obs;

  RxInt selectedRatingIndex = 0.obs;
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedPricingIndex = Integers.LOWEST_TO_HIGHEST_PRICE.obs;
  RxInt distanceFilteringOption = Integers.CLOSEST_TO_FARTHEST.obs;
  RxInt deliveryTimeFilteringOption = Integers.LESS_THAN_48_HOURS.obs;

  @override
  void onReady() {
    setGetArguments();
    super.onReady();
  }

  void setGetArguments() {
    meals = Get.arguments["meals"];
  }

  applyCategoryFilter() {
    filteredMeals.value = meals
        // .where((MealViewModel e) => false)
        .where((MealSearchViewModel e) =>
            int.parse(e.rating) ==
            ratings[selectedRatingIndex.value].value.round())
        .toList();
    // filteredMeals.value;
    // print(filteredMeals.value);

    // sortMealsByDistance();
    // sortMealByDeliveryTime();
    // sortMealsByPrice();
    gotoSearchScreen();
  }

  void sortMealsByPrice() {
    filteredMeals.sort((a, b) {
      if (pricing == Integers.LOWEST_TO_HIGHEST_PRICE) {
        return double.parse(a.lowestPrice)
            .compareTo(double.parse(b.lowestPrice));
      } else {
        return double.parse(b.lowestPrice)
            .compareTo(double.parse(a.lowestPrice));
      }
    });
  }

  void sortMealsByDistance() {
    filteredMeals.sort((a, b) {
      if (distanceFilteringOptions == Integers.CLOSEST_TO_FARTHEST) {
        return a.distance.compareTo(b.distance);
      } else {
        return b.distance.compareTo(a.distance);
      }
    });
  }

  void sortMealByDeliveryTime() {
    // filteredMeals.sort((a, b) {
    //   if (deliveryTimeSorting == Integers.LESS_THAN_48_HOURS) {
    //     return (a.distance - 0) < 10
    //         .compareTo(double.parse(b.lowestPrice));
    //   } else {
    //     return double.parse(b.lowestPrice)
    //         .compareTo(double.parse(a.lowestPrice));
    //   }
    // });
  }

  onRatingSelected(int rating) {
    selectedRatingIndex.value = rating;
  }

  onPricingSelected(int value) {
    selectedPricingIndex.value = value;
  }

  onDistanceFilteringOptionSelected(int value) {
    distanceFilteringOption.value = value;
  }

  onDeliveryTimeSelected(int value) {
    deliveryTimeFilteringOption.value = value;
  }

  void gotoNotificationScreen() => Get.to(() => NotificationScreen());

  onCategorySelected(int index) {
    selectedCategoryIndex.value = index;
  }

  void gotoSearchScreen() {
    pushReplacement(page: SearchScreen(), arguments: {
      "meals": filteredMeals.value,
      "searchQuery": "Filtered",
    });
  }
}
