// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/model/delivery_day.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/date_picker.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class DeliveryTimeScreenController extends GetxController {
  RxDouble subtotal = 0.0.obs;

  RxDouble total = 0.0.obs;

  TextEditingController deliveryTimeTextController = TextEditingController();

  RxString deliverTimeError = "".obs;

  RxInt indexOfSelectedDay = (-1).obs;

  String selectedDeliveryTime = "";

  RxList<DeliveryDay> chefDeliveryDays = <DeliveryDay>[].obs;

  @override
  void onReady() {
    initGetArguments();
    super.onReady();
  }

  void initGetArguments() {
    setAvailableDeliveryDate();
  }

  void setAvailableDeliveryDate() {
    String today = DateTimeUtil.dateTimeToDayOfWeek(DateTime.now());

    int indexOfToday = deliveryDays.indexWhere(
        (DeliveryDay e) => e.dayOfWeek.toLowerCase() == today.toLowerCase());

    DateTime deliveryDate_ = DateTime.now()..add(Duration(hours: 3));

    chefDeliveryDays.value = (Get.arguments["deliveryDays"] as List)
        .asMap()
        .map((int i, e) {
          DeliveryDay deliveryDay = DeliveryDay(dayOfWeek: e, enabled: false);

          if (deliveryDays.contains(deliveryDay) &&
              (i >= indexOfToday) &&
              deliveryDate_.hour >= 8 &&
              deliveryDate_.hour <= 20) {
            deliveryDays.value[i].enabled = true;
          }
          return MapEntry(i, deliveryDay);
        })
        .values
        .toList();
  }

  onDeliveryDaySelected(int index) => indexOfSelectedDay.value = index;

  void validateInputs() {
    if (GetUtils.isLengthLessThan(indexOfSelectedDay.value, 0)) {
      showFYSnackBar(message: Strings.validDeliveryDateErrorMessage);
    } else if (GetUtils.isBlank(selectedDeliveryTime)!) {
      showFYSnackBar(message: Strings.validDeliveryTimeErrorMessage);
    } else {
      gotoCartOrderSummaryScreen();
    }
  }

  void gotoCartOrderSummaryScreen() {
    Get.back(result: {
      "deliveryDay": chefDeliveryDays.value[indexOfSelectedDay.value],
      "deliverTime": selectedDeliveryTime,
    });
  }

  onTimeSelected() async {
    try {
      DateTime? deliveryTime = await showAppTimePicker();
      validateSelectedTime(deliveryTime);
    } catch (e) {
      print(e);
    }
  }

  void validateSelectedTime(DateTime? deliveryTime) {
    DateTime now = DateTime.now();
    if (deliveryTime == null || deliveryTime.difference(now).inHours < 2) {
      showFYSnackBar(
          message:
              "Delivery time should be at least 3 hours from current time");
    } else {
      setSelectedTime(deliveryTime);
    }
  }

  void setSelectedTime(DateTime deliveryTime) {
    String deliveryTimeString =
        DateTimeUtil.dateTimeToString(deliveryTime, Strings.HOUR_MINUTE_PM);

    deliveryTimeTextController.text = "$deliveryTimeString";
    selectedDeliveryTime = "${deliveryTime} ${deliveryTimeTextController.text}";
  }
}
