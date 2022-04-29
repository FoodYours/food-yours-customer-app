import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/main/main_common.dart';
import 'package:food_yours_customer/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late ApiClient apiClient = api.clone();

  @override
  loadUserData(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.user, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  saveProfileDetails(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.editProfile, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  requestVerificationCode(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.requestOtp, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  verifyCode(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.verifyOtp, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
