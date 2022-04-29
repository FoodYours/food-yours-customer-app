// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/model/online_cart_model.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/chef_screen/service/chef_service.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/home/view_model/chef_review_view_modal.dart';
import 'package:food_yours_customer/home/view_model/chef_view_model.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/search/screen/search_screen.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class ChefScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  ProductService productService = Get.find();
  ChefService chefService = Get.find();

  RxBool showSmallLoader = false.obs;
  RxBool showLargeLoader = false.obs;
  RxString loadingMessage = "".obs;

  RxInt cartItemsCount = 0.obs;

  late TabController tabController =
      TabController(length: Integers.chefScreenTabLength, vsync: this);

  ScrollController scrollController = ScrollController();

  late List<FoodCategoryViewModel> categories =
      FoodCategoryViewModel.getList(null).take(3).toList();

  late RxList<FoodCategoryViewModel> foodCategories = categories.obs;

  late RxList<ChefReviewViewModel> chefReviews = <ChefReviewViewModel>[].obs;

  late AnimationController animationCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0.47,
      upperBound: 1.0);

  late Animation<double> animation =
      CurvedAnimation(parent: animationCtrl, curve: Curves.easeInOutCirc);

  RxInt selectedTab = 1.obs;
  RxInt selectedFoodCategoryIndex = 0.obs;
  RxBool isFollowed = false.obs;

  Rx<ChefViewModel> chef = ChefViewModel().obs;
  RxList<MealSearchViewModel> chefMeals = <MealSearchViewModel>[].obs;
  MealViewModel meal = MealViewModel();

  RxList tags = [].obs;

  onSegmentSelected(value) {
    selectedTab.value = value;
  }

  onCategorySelected(int index, FoodCategoryViewModel foodCategory) {
    selectedFoodCategoryIndex.value = index;
    loadAllMealsUnderSelectedCategory();
  }

  loadAllMealsUnderSelectedCategory() async {
    showLargeLoader.value = true;

    loadingMessage.value = "loading Meals";

    Map<String, dynamic> requestInformation = setAllMealRequestInformation();

    AppResponse response = await productService
        .loadAllMealUnderSelectedCategory(requestInformation);

    showLargeLoader.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    gotoSearchScreen(response.data!,
        foodCategories.value[selectedFoodCategoryIndex.value].name);
  }

  Map<String, dynamic> setAllMealRequestInformation() {
    return {
      "categoryID":
          foodCategories.value[selectedFoodCategoryIndex.value].categoryId,
      "sKey": Strings.apiKey,
    };
  }

  toggleFollowingStatus() => isFollowed.value = !isFollowed.value;

  @override
  void onReady() {
    setGetArgument();
    initHiveData();
    super.onReady();
  }

  void setGetArgument() {
    chef.value = Get.arguments["chef"];
    tags.value = chef.value.chefsTags
        .split(",")
        .take(5)
        .takeWhile((String? value) => value != null)
        .toList();

    loadMealsByChef();
  }

  void initHiveData() async {
    cartItemsCount.value = await Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;
  }

  loadMealsByChef() async {
    showSmallLoader.value = true;

    Map<String, dynamic> requestInformation =
        setMealsByChefRequestInformation();

    AppResponse<List<MealSearchViewModel>> response =
        await chefService.loadMealsByChef(requestInformation);

    showSmallLoader.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    chefMeals.value = response.data!;
  }

  Map<String, dynamic> setMealsByChefRequestInformation() {
    return {
      "chefID": chef.value.chefID,
      "sKey": Strings.apiKey,
    };
  }

  loadChefReviews() async {
    showSmallLoader.value = true;

    Map<String, dynamic> requestInformation =
        setChefReviewsRequestInformation();

    AppResponse<List<ChefReviewViewModel>> response =
        await chefService.loadChefReviews(requestInformation);

    showSmallLoader.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    chefReviews.value = response.data!;
  }

  Map<String, dynamic> setChefReviewsRequestInformation() {
    return {
      "chefID": chef.value.chefID,
      "sKey": Strings.apiKey,
    };
  }

  addItemToCart(MealSearchViewModel mealSearchViewModel) async {
    CartModel? cartItem =
        Hive.box(Strings.CART_BOX).get(mealSearchViewModel.id);

    if (cartItem != null) {
      cartItem.count += 1;
      await addToOnlineCart(cartItem);
    } else {
      CartModel cartModel = generateCartModel(mealSearchViewModel);
      await addToOnlineCart(cartModel);
    }

    updateCartItemCount(1);
  }

  void addToLocalCart(CartModel cartItem) {
    Hive.box(Strings.CART_BOX).put(cartItem.id, cartItem);
  }

  Future<void> addToOnlineCart(CartModel cartItem) async {
    showLargeLoader.value = true;

    loadingMessage.value = "Adding item to cart";

    OnlineCartModel onlineCartModel = await setOnlineCartInformation(cartItem);

    AppResponse response =
        await productService.addToOnlineCart(onlineCartModel.toJSON());

    showLargeLoader.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    addToLocalCart(cartItem);
  }

  OnlineCartModel setOnlineCartInformation(CartModel cartItem) {
    return OnlineCartModel(
      idToken: token,
      foodId: cartItem.id,
      quantity: cartItem.count.toString(),
      mealAmount: cartItem.minimumMealPrice.toString(),
      extras: Map.fromIterable(cartItem.extras,
          key: (v) => v["name"], value: (v) => v["price"]),
      supplements: Map.fromIterable(cartItem.supplements,
          key: (v) => v["name"], value: (v) => v["price"]),
      notes: cartItem.note,
      deliveryDay: cartItem.specifiedDeliveryAndTime,
      total: cartItem.total.toString(),
    );
  }

  removeItemFromCart(MealSearchViewModel mealSearchViewModel) async {
    CartModel? cartItem =
        Hive.box(Strings.CART_BOX).get(mealSearchViewModel.id);

    if (cartItem != null && cartItem.count > 0) {
      cartItem.count -= 1;
      await addToOnlineCart(cartItem);

      updateCartItemCount(-1);
    }
  }

  CartModel generateCartModel(MealSearchViewModel mealModel) {
    return CartModel(
      id: mealModel.id,
      mealName: mealModel.name,
      note: "",
      quantity: {"name": mealModel.name, "price": mealModel.lowestPrice},
      supplements: [],
      extras: [],
      total: calculateTotalCostOfOrder(
          [],
          [],
          FYOptionItem(
              mealModel.name, mealModel.lowestPrice.replaceFirst(",", ""))),
      count: 1,
      minimumMealPrice:
          double.parse(mealModel.lowestPrice.replaceFirst(",", "")),
      chefName: mealModel.chefName,
      address: user.value.address,
      chefDeliveryDays: chef.value.deliveryDays,
      specifiedDeliveryAndTime:
          DateTimeUtil.dateTimeToString(DateTime.now().add(Duration(hours: 2))),
      chefId: chef.value.id,
      chefImageUrl: chef.value.chefImage,
    );
  }

  double calculateTotalCostOfOrder(List<FYOptionItem> suppliments,
      List<FYOptionItem> extras, FYOptionItem quantity) {
    return <FYOptionItem>[...suppliments, ...extras, quantity].fold(
        0.0,
        (double previousValue, element) =>
            (previousValue + double.parse(element.value)));
  }

  loadMeal(MealSearchViewModel selectedMeal) async {
    showLargeLoader.value = true;

    loadingMessage.value = "Fetching meal";

    Map<String, dynamic> requestInformation =
        setRequestMealInformation(selectedMeal.id);

    AppResponse<MealViewModel> response =
        await productService.loadMeal(requestInformation);

    showLargeLoader.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    meal = response.data!;

    gotoProductScreen();
  }

  gotoProductScreen() {
    Get.to(() => ProductScreen(), arguments: {"meal": meal});
  }

  Map<String, dynamic> setRequestMealInformation(String mealId) {
    return {
      "id": mealId,
      "sKey": Strings.apiKey,
    };
  }

  void gotoOrderSummary() {
    Get.off(() => CartOrderSummaryScreen(),
        arguments: {"chef": Get.arguments["chef"]});
  }

  gotoSearchScreen(meals, String categoryName) => Get.to(
        () => SearchScreen(),
        arguments: {
          "meals": meals,
          "searchQuery": categoryName,
        },
      );

  void updateCartItemCount(int value) {
    int cartItemsCount = Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount + value);
  }
}
