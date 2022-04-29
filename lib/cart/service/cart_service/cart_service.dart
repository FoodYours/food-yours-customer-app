import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/cart/view_model/address_view_model.dart';
import 'package:food_yours_customer/cart/view_model/cart_items_view_model.dart';
import 'package:food_yours_customer/cart/repository/cart_repository/cart_repository.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/instance_manager.dart';

class CartService {
  final CartRepository cartRepository = Get.find();

  fetchCartItems(Map<String, dynamic> json) async {
    Response response = await cartRepository.fetchCartItems(json);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<List<CartItemsViewModel>>(
          ResponseGrades.SUCCESS,
          response.statusCode!,
          "Success",
          CartItemsViewModel.getList(response.data));
    }
    return AppResponse<List<CartItemsViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  loadAddresses(Map<String, dynamic> json) async {
    Response response = await cartRepository.loadAddresses(json);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<AddressViewModel>(
          ResponseGrades.SUCCESS,
          response.statusCode!,
          "Success",
          AddressViewModel.fromJson(response.data));
    }
    return AppResponse<List<AddressViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  addNewAddress(Map<String, dynamic> json) async {
    Response response = await cartRepository.addNewAddress(json);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse(
        ResponseGrades.SUCCESS,
        response.statusCode!,
        "Success",
      );
    }
    return AppResponse<List<AddressViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }
}
