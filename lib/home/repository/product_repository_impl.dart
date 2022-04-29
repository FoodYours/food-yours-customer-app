import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/home/repository/product_repository.dart';
import 'package:food_yours_customer/main/main_common.dart';

class ProductRepositoryImpl implements ProductRepository {
  late ApiClient apiClient = api.clone();

  @override
  loadFoodCategories(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.foodCategories, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadAllMealUnderSelectedCategory(
      Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.allMeals, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadMealSugguestions(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.filter, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadMeal(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.meal, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  getDeliveryPrice() async {
    try {
      return await apiClient.dio!.post(Routes.meal);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadChef(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.chef, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadMealsByChef(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.chefMeals, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadChefReviews(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.chefReviews, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  addToOnlineCart(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.chefReviews, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
