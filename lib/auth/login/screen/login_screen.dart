import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/auth/widget/text_obscure_button.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/button/underlined_text_button.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_field/primary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController widgetCtrl = Get.put(LoginScreenController());

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
                SizedBox(
                  height: sh(Dimens.k99),
                ),
                FYLogo(
                  svgPath: Images.food_yours_logo,
                ),
                SizedBox(
                  height: sh(Dimens.k70),
                ),
                buildLoginForm(sw, context),
                SizedBox(
                  height: sh(Dimens.k64),
                ),
                Mulish400Text(
                  text: "Don’t have an account?",
                  color: FYColors.darkerBlack2,
                  textAlign: TextAlign.center,
                ),
                UnderlinedTextButton(
                  text: "Register Here",
                  onPressed: widgetCtrl.gotoRegistrationScreen,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget buildLoginForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);

    return FYRaisedCard(
      child: Column(
        children: [
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Mulish700Text(
            text: "Sign In",
            fontSize: Dimens.k24,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Mulish400Text(
            text: "Welcome back, please sign into your account",
            textAlign: TextAlign.center,
            fontSize: sh(Dimens.k12),
          ),
          SizedBox(
            height: sh(Dimens.k22),
          ),
          PrimaryTextField(
            hintText: "johndoe20@gmail.com",
            labelText: "Email",
            controller: widgetCtrl.emailTextCtrl,
            errorMessage: widgetCtrl.emailError.value,
            onChanged: widgetCtrl.clearEmailError,
          ),
          SizedBox(height: sh(Dimens.k12)),
          Obx(
            () => PrimaryTextField(
              hintText: "****************",
              labelText: "Password",
              controller: widgetCtrl.passwordTextCtrl,
              errorMessage: widgetCtrl.passwordError.value,
              obscureText: widgetCtrl.obscurePassword.value,
              onChanged: widgetCtrl.clearPasswordError,
              suffixIcon: TextObscureButton(
                onPressed: widgetCtrl.toggleObscurePassword,
                isObscured: widgetCtrl.obscurePassword.value,
              ),
            ),
          ),
          SizedBox(height: sh(Dimens.k26)),
          FYTextButton(
            text: "Sign in",
            onPressed: widgetCtrl.validateInputs,
          ),
          FYFlatButton(
            onPressed: widgetCtrl.gotoForgotPasswordScreen,
            child: Mulish600Text(
              text: "forgot password?",
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k22),
          ),
        ],
      ),
    );
  }
}
