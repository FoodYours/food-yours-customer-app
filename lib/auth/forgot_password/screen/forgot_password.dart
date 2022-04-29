import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/forgot_password/controller/forgot_password_screen_controller.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/button/underlined_text_button.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_field/primary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final ForgetPasswordScreenController widgetCtrl =
      Get.put(ForgetPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Scaffold(
          body: Stack(
            children: [
              AuthPagesBackgroundImage(),
              ListView(
                padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
                children: [
                  SizedBox(height: sh(Dimens.k99)),
                  FYLogo(
                    svgPath: Images.food_yours_logo,
                  ),
                  SizedBox(
                    height: sh(Dimens.k70),
                  ),
                  _buildResetPasswordForm(sw, context),
                  SizedBox(
                    height: sh(Dimens.k40),
                  ),
                  Mulish400Text(
                    text: "Don’t have an account?",
                    color: FYColors.darkerBlack2,
                    textAlign: TextAlign.center,
                  ),
                  UnderlinedTextButton(
                    text: "Register Here",
                    onPressed: widgetCtrl
                        .gotoNewPasswordScreen /* gotoRegistrationScreen */,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetPasswordForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);

    return FYRaisedCard(
      child: Column(
        children: [
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Mulish700Text(
            text: "Forgot Password",
            fontSize: Dimens.k24,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Mulish400Text(
            text: "We will send an email to reset your password",
            textAlign: TextAlign.center,
            fontSize: sh(Dimens.k12),
          ),
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Obx(
            () => PrimaryTextField(
              hintText: "johndoe20@gmail.com",
              labelText: "Email",
              controller: widgetCtrl.emailTextCtrl,
              onChanged: widgetCtrl.clearEmailError,
              errorMessage: widgetCtrl.emailError.value,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k40),
          ),
          Center(
            child: FYTextButton(
              text: "Send Recovery Email",
              onPressed: widgetCtrl.validateInput,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k40),
          ),
        ],
      ),
    );
  }
}
