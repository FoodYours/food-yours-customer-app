import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/cart/repository/cart_repository/cart_repository.dart';
import 'package:food_yours_customer/main/main_common.dart';

class CartRepositoryImpl implements CartRepository {
  late ApiClient apiClient = api.clone();

  fetchCartItems(Map<String, dynamic> json) async {
    try {
      return await apiClient.dio!.post(Routes.fetchCart, data: json);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadAddresses(Map<String, dynamic> json) async {
    try {
      return await apiClient.dio!.post(Routes.getAddresses, data: json);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  addNewAddress(Map<String, dynamic> json) async {
    try {
      return await apiClient.dio!.post(Routes.getAddresses, data: json);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
