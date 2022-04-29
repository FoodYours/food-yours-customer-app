import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/user/phone_number_verification/controller/phone_number_verification_screen.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
  final PhoneNumberVerificationController widgetCtrl =
      Get.put(PhoneNumberVerificationController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Container(
          color: FYColors.subtleBlack5,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: FYColors.subtleBlack5,
              appBar: PreferredSize(
                preferredSize: Size(
                  Dimens.k20,
                  sh(Dimens.k46_41),
                ),
                child: PrimaryAppBar(
                  title: "Verify Phone Number",
                  elevation: 2.0,
                  fontSize: Dimens.k16,
                ),
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: sw(Dimens.k24),
                ),
                children: [
                  SizedBox(height: sh(Dimens.k54)),
                  Mulish400Text(
                    text: "Phone Number:",
                    fontSize: sh(Dimens.k16),
                  ),
                  SizedBox(
                    height: sh(Dimens.k5),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Mulish400Text(
                          text: widgetCtrl.phoneNumber.value,
                          fontSize: sh(Dimens.k16),
                          color: FYColors.darkerBlack2,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimens.k15,
                            ),
                            FYTextButton(
                              text: "Change",
                              size: Size(Dimens.k0, Dimens.k0),
                              onPressed: widgetCtrl.changePhoneNumber,
                              backgroundColor: Colors.transparent,
                              textColor: FYColors.mainBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh(Dimens.k64),
                  ),
                  FYTextButton(
                    text: "Request for verification code",
                    onPressed: widgetCtrl.requestVerificationCode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
