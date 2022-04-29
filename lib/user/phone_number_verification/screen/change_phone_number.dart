import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/user/phone_number_verification/controller/change_phone_number_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  final ChangePhoneNumberController widgetCtrl =
      Get.put(ChangePhoneNumberController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(
            preferredSize: Size(Dimens.k20, sh(Dimens.k46_41)),
            child: PrimaryAppBar(
              title: "Change Number",
              elevation: 2.0,
              fontSize: Dimens.k16,
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: sw(Dimens.k24),
            ),
            children: [
              SizedBox(
                height: sh(Dimens.k16),
              ),
              Obx(
                () => InputFieldWrapper(
                  labelText: "Enter New Phone Number",
                  labelColor: FYColors.lighterBlack2,
                  child: SecondaryTextField(
                    hintText: "07123456789",
                    hintTextColor: FYColors.subtleBlack,
                    controller: widgetCtrl.phoneTextCtrl,
                    onChanged: widgetCtrl.clearPhoneError,
                    errorMessage: widgetCtrl.phoneError.value,
                  ),
                ),
              ),
              SizedBox(
                height: sh(Dimens.k16),
              ),
              Obx(
                () => InputFieldWrapper(
                  labelText: "Enter Password",
                  labelColor: FYColors.lighterBlack2,
                  child: SecondaryTextField(
                    hintText: "*************",
                    hintTextColor: FYColors.subtleBlack,
                    controller: widgetCtrl.passwordTextCtrl,
                    onChanged: widgetCtrl.clearPasswordError,
                    errorMessage: widgetCtrl.passwordError.value,
                  ),
                ),
              ),
              SizedBox(
                height: sh(Dimens.k24),
              ),
              FYTextButton(
                text: "Change Number",
                onPressed: widgetCtrl.validateInput,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
