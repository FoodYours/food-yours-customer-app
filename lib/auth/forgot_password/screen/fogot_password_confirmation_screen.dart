import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/forgot_password/controller/forgot_password_confirmation_screen_controller.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordConfirmationScreen extends StatelessWidget {
  final ForgetPasswordConfirmationScreenController widgetCtrl =
      Get.put(ForgetPasswordConfirmationScreenController());

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
              LocalTheme(
                backGroundColor: context.theme.primaryColor,
                child: FYLogo(
                    svgPath: Images.food_yours_logo,
                    height: sh(33.9),
                    width: sw(165)),
              ),
              SizedBox(
                height: sh(Dimens.k70),
              ),
              _buildLoginForm(sw, context),
              SizedBox(
                height: sh(Dimens.k115),
              ),
              Text(
                "Don’t have an account?",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline5!
                    .copyWith(fontSize: sh(Dimens.k16)),
              ),
              Center(
                child: LocalTheme(
                  child: FYTextButton(
                    text: "Register Here",
                    onPressed: widgetCtrl.gotoRegistrationScreen,
                    decoration: TextDecoration.underline,
                  ),
                  buttonTextStyle: context.theme.textTheme.headline3,
                ),
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
            text: "Confirm Email",
            textAlign: TextAlign.center,
            fontSize: Dimens.k24,
          ),
          SizedBox(
            height: sh(Dimens.k24),
          ),
          Obx(
            () => RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "We sent a link to confirm your supplied email address"
                        "please click the link in the email we sent to verify"
                        "your email. Email: ",
                    style: context.theme.textTheme.headline2!.copyWith(
                      fontSize: sh(Dimens.k12),
                    ),
                  ),
                  TextSpan(
                    text: widgetCtrl.email.value,
                    style: context.theme.textTheme.headline2!.copyWith(
                      fontSize: sh(Dimens.k12),
                      color: FYColors.mainBlue,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: sh(Dimens.k40),
          ),
          Center(
            child: FYTextButton(
              text: "Open email app",
              onPressed: widgetCtrl.openEmailApp,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k79),
          ),
        ],
      ),
    );
  }
}
