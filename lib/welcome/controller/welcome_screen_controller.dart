// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_yours_customer/auth/login/screen/login_screen.dart';
import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uni_links/uni_links.dart';

class WelcomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  PreferenceRepository preferenceRepository = Get.find();

  late StreamSubscription linksStreamSubcription;

  String linkThatOpenedTheApp = "";

  var slideOffset = Rx(Offset(1, 0));

  gotoLoginScreen() => Get.to(() => LoginScreen());

  gotoRegistrationScreen() => Get.to(() => RegistrationScreen());

  @override
  void onReady() {
    slideOffset.value -= Offset(1, 0);
    super.onReady();
  }

  @override
  void onInit() {
    // checkIfAppWasOpenedViaLink();
    // setUpLinkslistenerForWhenAppIsInBackground();
    super.onInit();
  }

  void gotoNextScreen() {
    if (linkThatOpenedTheApp == "") {
      gotoNextScreenWhenAppIsOpenedWithoutLinks();
    } else {
      gotoNextScreenWhenAppIsOpenedWithLinks();
    }
  }

  void gotoNextScreenWhenAppIsOpenedWithLinks() {
    Get.offAll(() => LoginScreen());
  }

  void gotoNextScreenWhenAppIsOpenedWithoutLinks() {
    print(preferenceRepository.getStringPref(Strings.stageOfUsage));
    if (preferenceRepository.getStringPref(Strings.stageOfUsage) ==
        StageOfUsage.REGISTERED.toString()) {
      Get.offAll(() => LoginScreen());
    }
  }

  Future<void> checkIfAppWasOpenedViaLink() async {
    try {
      linkThatOpenedTheApp = await getInitialLink() ?? "";
    } on PlatformException {
      debugPrint("unable to getInitialLink");
    }
  }

  void setUpLinkslistenerForWhenAppIsInBackground() {
    Future<void> initUniLinks() async {
      linksStreamSubcription = linkStream.listen((String? link) {
        linkThatOpenedTheApp = link ?? "";
        gotoNextScreenWhenAppIsOpenedWithLinks();
      }, onError: (err) {
        debugPrint("unable to getInitialLink");
      });
    }
  }
}
