import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/user/repository/user_repository.dart';
import 'package:food_yours_customer/user/view_model/user_view_model.dart';
import 'package:get/instance_manager.dart';

class UserService {
  final UserRepository userRepository = Get.find();

  Future<AppResponse<UserViewModel>> loadUserData(
      Map<String, dynamic> requestInformation) async {
    Response response = await userRepository.loadUserData(requestInformation);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"],
          responseBody["message"], UserViewModel.fromJson(responseBody));
    }
    return AppResponse(
        ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }

  Future<AppResponse> saveProfileDetails(
      Map<String, dynamic> requestInformation) async {
    Response response =
        await userRepository.saveProfileDetails(requestInformation);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"],
          responseBody["message"]);
    }
    return AppResponse(
        ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }

  requestVerificationCode(Map<String, dynamic> json) async {
    Response response = await userRepository.requestVerificationCode(json);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"],
          responseBody["message"]);
    }
    return AppResponse(
        ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }

  verifyCode(Map<String, dynamic> json) async {
    Response response = await userRepository.verifyCode(json);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"],
          responseBody["message"]);
    }
    return AppResponse(
        ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }
}
