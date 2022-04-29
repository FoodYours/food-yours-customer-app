import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CartItemsViewModel {
  String cartId;
  String total;
  String qty;
  String foodOrdered;
  String foodCost;
  String mealPic;
  String extras;
  String totalExtracost;
  String suppliments;
  String totalSuppliments;
  String notes;
  String deliveryDay;
  String addedToCartDay;
  String chefName;
  String chefImage;
  String chefId;

  CartItemsViewModel({
    this.cartId = "",
    this.total = "",
    this.qty = "",
    this.foodOrdered = "",
    this.foodCost = "",
    this.mealPic = "",
    this.extras = "",
    this.totalExtracost = "",
    this.suppliments = "",
    this.totalSuppliments = "",
    this.notes = "",
    this.deliveryDay = "",
    this.addedToCartDay = "",
    this.chefName = "",
    this.chefImage = "",
    this.chefId = "",
  });

  CartItemsViewModel.fromJson(Map<String, dynamic>? json)
      : cartId = json?['cartId'] ?? "",
        total = json?['total'] ?? "",
        qty = json?['qty'] ?? "",
        foodOrdered = json?['foodOrdered'] ?? "",
        foodCost = json?['foodCost'] ?? "",
        mealPic = json?['mealPic'] ?? "",
        extras = json?['extras'] ?? "",
        totalExtracost = json?['totalExtracost'] ?? "",
        suppliments = json?['suppliments'] ?? "",
        totalSuppliments = json?['totalSuppliments'] ?? "",
        notes = json?['notes'] ?? "",
        deliveryDay = json?['deliveryDay'] ?? "",
        addedToCartDay = json?['addedToCartDay'] ?? "",
        chefName = json?['chefName'] ?? "",
        chefImage = json?['chefImage'] ?? "",
        chefId = json?['chefID'] ?? "";

  static getList(List? json) {
    List<Map<String, dynamic>> cartItems =
        List<Map<String, dynamic>>.from(json ?? []);
    return List.generate(cartItems.length,
        (index) => CartItemsViewModel.fromJson(cartItems[index])).obs;
  }
}
