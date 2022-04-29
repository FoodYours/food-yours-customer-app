import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:food_yours_customer/common/service/fcm_service.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  final PreferenceRepository preferenceRepository = Get.find();
  final FCMService fcmService = Get.find();

  RxBool enableNotification = true.obs;
  RxBool isLoading = false.obs;

  RxString loadingMessage = "loading notifications ...".obs;
  RxString loadingError = "".obs;

  @override
  void onReady() {
    getFcmPermissionStatus();
    super.onReady();
  }

  void getFcmPermissionStatus() async {
    enableNotification.value = await preferenceRepository
            .getBooleanPref(Strings.IS_FCM_PERMISSION_REVOKED) ??
        true;
  }

  onOptionSelected(Widget page) {
    Get.to(() => page);
  }

  toggleNotification(bool value) async {
    enableNotification.value = value;
    isLoading.value = true;
    loadingMessage.value = "Disabling Notifications";
    bool isFCMPermissionRevoked = await fcmService.revokeFCMPermission();
    isLoading.value = false;
    saveNotificationPermissionStatus(isFCMPermissionRevoked);
  }

  void saveNotificationPermissionStatus(bool isFCMPermissionRevoked) {
    preferenceRepository.setBooleanPref(
        Strings.IS_FCM_PERMISSION_REVOKED, isFCMPermissionRevoked);
  }
}
