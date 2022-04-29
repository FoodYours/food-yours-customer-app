import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/fy_drop_down.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/square_image.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/user/person_details/controller/personal_details_screen_controller.dart';
import 'package:food_yours_customer/user/person_details/widget/image_editing_button.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final PersonalDetailsScreenController widgetCtrl =
      Get.put(PersonalDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Container(
          color: context.theme.backgroundColor,
          child: Scaffold(
            backgroundColor: FYColors.subtleBlack5,
            appBar: PreferredSize(
                preferredSize: Size(sw(20), sh(46.41)),
                child: SecondaryAppBar(title: "Personal Details")),
            body: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
                children: [
                  SizedBox(height: sh(24)),
                  Center(
                    child: Stack(
                      children: [
                        SquareImage(height: sh(80), width: sw(80)),
                        Positioned(
                            right: 0, bottom: 0, child: ImageEditButton()),
                      ],
                    ),
                  ),
                  SizedBox(height: sh(24)),
                  Obx(() => InputFieldWrapper(
                        labelText: "First Name",
                        child: SecondaryTextField(
                          hintText: "John",
                          hintTextColor: FYColors.subtleBlack,
                          controller: widgetCtrl.firstNameTextCtrl,
                          errorMessage: widgetCtrl.firstNameError.value,
                          onChanged: widgetCtrl.clearFirstNameError,
                        ),
                      )),
                  SizedBox(height: sh(16)),
                  Obx(() => InputFieldWrapper(
                        labelText: "Last Name",
                        child: SecondaryTextField(
                          hintText: "Doe",
                          hintTextColor: FYColors.subtleBlack,
                          controller: widgetCtrl.lastNameTextCtrl,
                          errorMessage: widgetCtrl.lastNameError.value,
                          onChanged: widgetCtrl.clearLastNameError,
                        ),
                      )),
                  SizedBox(height: sh(16)),
                  Obx(() => InputFieldWrapper(
                        labelText: "Email",
                        child: SecondaryTextField(
                          hintText: "johndoe@google.com",
                          hintTextColor: FYColors.subtleBlack,
                          controller: widgetCtrl.emailTextCtrl,
                          errorMessage: widgetCtrl.emailError.value,
                          onChanged: widgetCtrl.clearEmailError,
                        ),
                      )),
                  SizedBox(height: sh(16)),
                  Obx(() => InputFieldWrapper(
                        labelText: "Phone Number",
                        child: SecondaryTextField(
                          hintText: "0701 234 5678",
                          hintTextColor: FYColors.subtleBlack,
                          controller: widgetCtrl.phoneTextCtrl,
                          errorMessage: widgetCtrl.phoneError.value,
                          onChanged: widgetCtrl.clearPhoneError,
                          prefixIcon: SizedBox(
                            width: 85,
                            child: LocalTheme(
                              buttonTextStyle:
                                  context.theme.textTheme.bodyText1,
                              bodyStyle2: context.theme.textTheme.bodyText2,
                              child: FYCountryCodePicker(
                                  selectedCountryCode: CountryCode(
                                flagUri: Images.chef_place_holder,
                                name: "Nigeria",
                                code: "NG",
                                dialCode: "+234",
                              )),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: sh(16)),
                  GestureDetector(
                    onTap: () => widgetCtrl.setDateOfBirth(),
                    child: InputFieldWrapper(
                      labelText: "Date of Birth(optional)",
                      child: Obx(() => SecondaryTextField(
                            hintText: "day / month",
                            enabled: false,
                            hintTextColor: FYColors.subtleBlack,
                            controller: widgetCtrl.dobTextCtrl,
                            errorMessage: widgetCtrl.dobError.value,
                            onChanged: widgetCtrl.clearDobError,
                          )),
                    ),
                  ),
                  SizedBox(height: sh(16)),
                  Obx(
                    () => InputFieldWrapper(
                      labelText: "Gender",
                      child: FYDropDownButton(
                        errorMessage: widgetCtrl.genderError.value,
                        hintText: "Gender",
                        onChanged: widgetCtrl.onGenderSelected,
                        selectedOption: widgetCtrl.selectedGender.value,
                        isExpanded: true,
                        options: widgetCtrl.genders,
                        borderColor: FYColors.lighterBlack2,
                      ),
                    ),
                  ),
                  SizedBox(height: sh(16)),
                  InputFieldWrapper(
                    labelText: "Password",
                    child: SecondaryTextField(
                      hintText: "Enter Password",
                      hintTextColor: FYColors.subtleBlack,
                      controller: widgetCtrl.passwordTextCtrl,
                      enabled: false,
                    ),
                  ),
                  SizedBox(height: sh(24)),
                  FYTextButton(
                    text: "Save and Close",
                    onPressed: widgetCtrl.validateInput,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
