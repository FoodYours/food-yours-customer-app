import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/forgot_password/controller/new_password_screen_controller.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/auth/widget/text_obscure_button.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/button/underlined_text_button.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_field/primary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/instance_manager.dart';

class NewPasswordScreen extends StatelessWidget {
  final NewPasswordScreenController widgetCtrl =
      Get.put(NewPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Scaffold(
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
              _buildLoginForm(sw, context),
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
                onPressed: widgetCtrl.gotoRegistrationScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);

    return FYRaisedCard(
      child: Column(
        children: [
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Mulish700Text(
            text: "New Password",
            fontSize: Dimens.k24,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Mulish400Text(
            text: "Try not use the name on your email address",
            textAlign: TextAlign.center,
            fontSize: sh(Dimens.k12),
          ),
          SizedBox(
            height: sh(Dimens.k20),
          ),
          PrimaryTextField(
            labelText: "New Password",
            hintText: "****************",
            suffixIcon: TextObscureButton(
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: sh(Dimens.k12),
          ),
          PrimaryTextField(
            labelText: "Confirm New Password",
            hintText: "****************",
            suffixIcon: TextObscureButton(
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: sh(Dimens.k44),
          ),
          Center(
            child: FYTextButton(
              text: "Reset Password",
              onPressed: widgetCtrl.gotoPasswordResetConfirmationScreen,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k49),
          ),
        ],
      ),
    );
  }
}
