import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/fy_pin_field.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/user/phone_number_verification/controller/otp_verification_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class OtpVerificationScreen extends StatelessWidget {
  final OtpVerificationController widgetCtrl =
      Get.put(OtpVerificationController());

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
                  preferredSize: Size(Dimens.k20, sh(Dimens.k46_41)),
                  child: PrimaryAppBar(
                    title: "OTP Verification",
                    elevation: 2.0,
                    fontSize: Dimens.k16,
                  )),
              body: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: sw(Dimens.k24),
                ),
                children: [
                  SizedBox(height: sh(Dimens.k44)),
                  Mulish600Text(
                    text: "Enter OTP",
                    fontSize: sh(Dimens.k24),
                    color: FYColors.darkerBlack2,
                  ),
                  SizedBox(
                    height: sh(Dimens.k24),
                  ),
                  Mulish400Text(
                    text:
                        "We sent a 5 digit one-time password to your registered number, please input it below.",
                    maxLines: 5,
                    fontSize: sh(Dimens.k16),
                  ),
                  SizedBox(
                    height: sh(Dimens.k28),
                  ),
                  FYPinField(
                    controller: widgetCtrl.otpTextController,
                  ),
                  SizedBox(
                    height: sh(Dimens.k40),
                  ),
                  FYTextButton(
                    text: "Verify",
                    onPressed: widgetCtrl.verifyCode,
                  ),
                  SizedBox(
                    height: sh(Dimens.k64),
                  ),
                  Mulish400Text(
                    text:
                        "Didn’t receive any code? Please wait few minutes before requesting for a new one.",
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    fontSize: sh(Dimens.k16),
                  ),
                  SizedBox(
                    height: sh(Dimens.k24),
                  ),
                  FYTextButton(
                    text: "Resend Code",
                    backgroundColor: Colors.transparent,
                    textColor: FYColors.mainRed,
                    textDecoration: TextDecoration.underline,
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
