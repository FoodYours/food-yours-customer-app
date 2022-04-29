// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/twin_buttons.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';

Future showAlertDialog({
  String? notificationIcon,
  String title = "Location Access",
  String message =
      "Foodyours is asking for permission to access your device location to give you best ordering experience.This permission is required for ordering.",
  String buttonText = "Grant Access",
  isSuccess = false,
}) {
  final Function sh = sHeight(Get.context!);
  final Function sw = sWidth(Get.context!);

  return Get.dialog(
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw(24.0)),
            height: sh(Dimens.k277),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.k12),
              child: Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sh(17.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: sh(Dimens.k20)),
                    SvgPicture.asset(
                        notificationIcon ?? Images.notification_symbol,
                        width: sw(40),
                        height: sh(40)),
                    SizedBox(height: sh(Dimens.k16)),
                    Text(title,
                        style: Get.context!.theme.textTheme.headline5!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700,
                            color: isSuccess ? FYColors.mainGreen : null)),
                    SizedBox(height: sh(Dimens.k24)),
                    Container(
                      width: sw(293),
                      child: Mulish400Text(
                        text: message,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        color: FYColors.lighterBlack2,
                        fontSize: sh(Dimens.k12),
                      ),
                    ),
                    SizedBox(height: sh(Dimens.k24)),
                    FYTwinButton(
                        isSuccess: isSuccess,
                        firstBtnText: "Dismiss",
                        firstBtnTextColor: FYColors.lighterBlack2,
                        firstBtnColor: Colors.transparent,
                        secondBtnText: buttonText,
                        secondBtnColor: Colors.transparent)
                  ],
                ),
              )),
            ),
          ),
          SizedBox(height: sh(Dimens.k40)),
          buildCancelButton(sw, sh),
        ],
      ),
    ),
    useSafeArea: true,
    barrierColor: Colors.black.withOpacity(0.85),
  );
}

FYButton buildCancelButton(Function sw, Function sh) {
  return FYButton(
    child: Container(
      width: sw(Dimens.k40),
      height: sh(Dimens.k40),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(FYIcons.x),
    ),
    onTap: pop,
  );
}

// void showFYSnackBar({
//   ResponseGrades responseGrades = ResponseGrades.ERROR,
//   String message = "",
//   Function()? action,
//   String actionText = "",
// }) {
//   Get.showSnackbar(GetBar(
//     backgroundColor: getSnackBarColor(responseGrades),
//     // title: type == AlertType.ERROR ? 'Error' : 'Success',
//     icon: Icon(Icons.error_outline_rounded),
//     message: '$message',
//     duration: Duration(seconds: 3),
//     snackPosition: SnackPosition.TOP,
//     isDismissible: true,
//     onTap: (obj) => action != null ? action() : pop(),
//   ));
// }

showFYSnackBar({
  String message = "",
  Function()? action,
  String actionText = "",
  ResponseGrades responseGrades = ResponseGrades.ERROR,
}) {
  final Function sh = sHeight(Get.context!);

  final snackBar = SnackBar(
    content: Container(
      height: sh(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AutoSizeText(message, textAlign: TextAlign.center)),
        ],
      ),
    ),
    action: action == null
        ? null
        : SnackBarAction(
            label: actionText,
            textColor: Colors.white,
            onPressed: action,
          ),
    behavior: SnackBarBehavior.floating,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.k8)),
    backgroundColor: getSnackBarColor(responseGrades),
  );

  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}

Color getSnackBarColor(ResponseGrades responseGrades) {
  if (responseGrades == ResponseGrades.ERROR) {
    return FYColors.mainOrange;
  } else if (responseGrades == ResponseGrades.INFO) {
    return FYColors.mainBlue;
  } else if (responseGrades == ResponseGrades.WARNING) {
    return FYColors.mainYellow;
  } else {
    return FYColors.mainGreen;
  }
}
