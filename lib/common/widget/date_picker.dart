import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

Future<DateTime?> showAppDatePicker() async {
  return await showDatePicker(
    context: Get.context!,
    initialDate: DateTime(
        DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    lastDate: DateTime(
        DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    firstDate: DateTime(DateTime.now().year - 100),
  );
}

Future<DateTime?> showAppTimePicker({DateTime? time}) async {
  Function sh = sHeight(Get.context!);
  Function sw = sHeight(Get.context!);

  DateTime selectedTime = time ?? DateTime.now();

  return await showCupertinoModalPopup<DateTime>(
    context: Get.context!,
    builder: (_) => FYFlatButton(
      child: Container(
        color: Colors.white,
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: selectedTime,
          minimumDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            8,
          ),
          maximumDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            23,
          ),
          onDateTimeChanged: (DateTime val) => selectedTime = val,
        ),
      ),
      onPressed: () => Get.back(result: selectedTime),
    ),
  );
}
