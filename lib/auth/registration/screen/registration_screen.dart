import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/registration/controller/registration_screen_controller.dart';
import 'package:food_yours_customer/common/widget/fy_raised_card.dart';
import 'package:food_yours_customer/auth/widget/text_obscure_button.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/button/underlined_text_button.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_field/primary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationScreenController widgetCtrl =
      Get.put(RegistrationScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context, mockupHeight: 914);
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
                  _buildRegistrationForm(sw, context),
                  SizedBox(height: sh(Dimens.k40)),
                  Mulish400Text(
                    text: "Already a user?",
                    textAlign: TextAlign.center,
                    fontSize: Dimens.k16,
                    color: FYColors.darkerBlack2,
                  ),
                  Center(
                    child: UnderlinedTextButton(
                      text: "Sign in",
                      onPressed: widgetCtrl.gotoLoginScreen,
                    ),
                  ),
                  SizedBox(
                    height: sh(Dimens.k24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);

    return FYRaisedCard(
      child: Column(
        children: [
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Mulish700Text(
            text: "Register",
            fontSize: Dimens.k24,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Mulish400Text(
            text: "Welcome, create an account to get started",
            textAlign: TextAlign.center,
            fontSize: sh(Dimens.k12),
          ),
          SizedBox(
            height: sh(Dimens.k26),
          ),
          Obx(() => PrimaryTextField(
                labelText: "First Name",
                hintText: "John",
                controller: widgetCtrl.firstNameTextCtrl,
                errorMessage: widgetCtrl.firstNameError.value,
                onChanged: widgetCtrl.clearFirstNameError,
              )),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Obx(() => PrimaryTextField(
                labelText: "Last Name",
                hintText: "Doe",
                controller: widgetCtrl.lastNameTextCtrl,
                errorMessage: widgetCtrl.lastNameError.value,
                onChanged: widgetCtrl.clearLastNameError,
              )),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Obx(() => Row(
                children: [
                  SizedBox(
                    width: Dimens.k85,
                    child: FYCountryCodePicker(
                      onChanged: widgetCtrl.onCountrySelected,
                      selectedCountryCode: widgetCtrl.selectedCountryCode.value,
                    ),
                  ),
                  Expanded(
                    child: PrimaryTextField(
                      labelText: "Phone Number",
                      hintText: "0712 345 6789",
                      controller: widgetCtrl.phoneNumberTextCtrl,
                      errorMessage: widgetCtrl.phoneNumberError.value,
                      onChanged: widgetCtrl.clearPhoneNumberError,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Obx(() => PrimaryTextField(
                labelText: "Email",
                hintText: "johndoe20@gmail.com",
                controller: widgetCtrl.emailTextCtrl,
                errorMessage: widgetCtrl.emailError.value,
                onChanged: widgetCtrl.clearEmailError,
              )),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Obx(
            () => PrimaryTextField(
              labelText: "Password",
              hintText: "****************",
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
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Obx(
            () => PrimaryTextField(
              labelText: "Confirm Password",
              hintText: "****************",
              controller: widgetCtrl.confirmPasswordTextCtrl,
              errorMessage: widgetCtrl.confirmPasswordError.value,
              obscureText: widgetCtrl.obscureConfirmPassword.value,
              onChanged: widgetCtrl.clearConfirmPasswordError,
              suffixIcon: TextObscureButton(
                onPressed: widgetCtrl.toggleObscureConfirmPassword,
                isObscured: widgetCtrl.obscureConfirmPassword.value,
              ),
            ),
          ),
          SizedBox(
            height: sh(Dimens.k22),
          ),
          Center(
            child: FYTextButton(
              text: "Register",
              onPressed: widgetCtrl.validateInputs,
            ),
          ),
          SizedBox(
            height: sh(Dimens.k21),
          ),
        ],
      ),
    );
  }
}
