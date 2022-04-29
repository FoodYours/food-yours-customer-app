import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/screen/chef_screen.dart';
import 'package:food_yours_customer/chef_screen/service/chef_service.dart';
import 'package:food_yours_customer/home/view_model/chef_view_model.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/search/screen/filter_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SearchScreenController extends GetxController {
  ProductService productService = Get.find();
  ChefService chefService = Get.find();

  RxList<MealSearchViewModel> meals = <MealSearchViewModel>[].obs;

  Rx<FoodCategoryViewModel> foodCategory = FoodCategoryViewModel().obs;
  Rx<MealViewModel> meal = MealViewModel().obs;
  Rx<ChefViewModel> chef = ChefViewModel().obs;

  RxInt mealsCount = 0.obs;
  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onReady() {
    setGetArguments();
    super.onReady();
  }

  void setGetArguments() {
    meals.assignAll(Get.arguments["meals"]);
    searchTextEditingController.text = Get.arguments["searchQuery"];
    mealsCount.value = meals.length;
  }

  goToChefProfile() =>
      Get.to(() => ChefScreen(), arguments: {"chef": chef.value});

  gotoFilterScreen() =>
      Get.to(() => FilterScreen(), arguments: {"meals": meals});

  gotoMealScreen() => Get.to(() => ProductScreen(), arguments: {
        "meal": meal.value,
        "chefDeliveryDays": chef.value.deliveryDays,
        "chefId": chef.value.chefID,
        "chefImageUrl": chef.value.chefImage,
      });

  onMealSelected(MealSearchViewModel selectedMeal) async {
    bool loadMealSuccess = await loadMeal(selectedMeal);
    if (loadMealSuccess) {
      bool loadChefSuccess = await loadChef(selectedMeal);
      if (loadChefSuccess) gotoMealScreen();
    }
  }

  onChefSelected(MealSearchViewModel selectedMeal) async {
    bool isSuccess = await loadChef(selectedMeal);
    if (isSuccess) goToChefProfile();
  }

  Map<String, dynamic> setRequestMealInformation(String mealId) {
    return {
      "id": mealId,
      "sKey": Strings.apiKey,
    };
  }

  Map<String, dynamic> setRequestChefInformation(String chefId) {
    return {
      "chefID": chefId,
      "idToken": token,
      "sKey": Strings.apiKey,
    };
  }

  Future<bool> loadMeal(MealSearchViewModel selectedMeal) async {
    isLoading.value = true;

    loadingMessage.value = "Fetching meal";

    Map<String, dynamic> requestInformation =
        setRequestMealInformation(selectedMeal.id);

    AppResponse<MealViewModel> response =
        await productService.loadMeal(requestInformation);

    isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return false;

    meal.value = response.data!;

    return true;
  }

  Future<bool> loadChef(MealSearchViewModel selectedMeal) async {
    isLoading.value = true;

    loadingMessage.value = "Fetching chef Information";

    Map<String, dynamic> requestInformation =
        setRequestChefInformation(selectedMeal.chefID);

    AppResponse<ChefViewModel> response =
        await chefService.loadChef(requestInformation);

    isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return false;

    chef.value = response.data!;

    return true;
  }
}
