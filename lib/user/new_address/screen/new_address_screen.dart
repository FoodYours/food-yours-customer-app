import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/fy_drop_down.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/user/new_address/controller/new_address_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class NewAddressScreen extends StatelessWidget {
  final NewAddressController widgetCtrl = Get.put(NewAddressController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        message: widgetCtrl.loadingMessage.value,
        isLoading: widgetCtrl.isLoading.value,
        child: Container(
          color: context.theme.backgroundColor,
          child: Scaffold(
            backgroundColor: FYColors.subtleBlack5,
            appBar: PreferredSize(
                preferredSize: Size(sw(20), sh(46.41)),
                child: SecondaryAppBar(title: "New Address")),
            body: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
                children: [
                  InputFieldWrapper(
                    labelText: "Address Line 1",
                    labelColor: FYColors.lighterBlack2,
                    child: SecondaryTextField(
                      hintText: "Plot 5 Ibeju-Lekki",
                      hintTextColor: FYColors.subtleBlack,
                      controller: widgetCtrl.streetTextCtrl,
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k16)),
                  InputFieldWrapper(
                    labelText: "Address Line 2",
                    labelColor: FYColors.lighterBlack2,
                    child: SecondaryTextField(
                      hintText: "Lagos Nigeria",
                      hintTextColor: FYColors.subtleBlack,
                      controller: widgetCtrl.stateTextCtrl,
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k16)),
                  InputFieldWrapper(
                    labelText: "Contact Numbe)r",
                    labelColor: FYColors.lighterBlack2,
                    child: SecondaryTextField(
                      hintText: "0701 234 5678",
                      hintTextColor: FYColors.subtleBlack,
                      prefixIcon: SizedBox(
                        width: Dimens.k85,
                        child: LocalTheme(
                          buttonTextStyle: context.theme.textTheme.bodyText1,
                          bodyStyle2: context.theme.textTheme.bodyText2,
                          child: FYCountryCodePicker(
                            selectedCountryCode: CountryCode(
                              flagUri: Images.chef_place_holder,
                              name: "Nigeria",
                              code: "NG",
                              dialCode: "+234",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k16)),
                  Obx(
                    () => InputFieldWrapper(
                      labelText: "Name this Address(e.g home, work, gym etc.)",
                      labelColor: FYColors.lighterBlack2,
                      child: FYDropDownButton(
                        errorMessage: widgetCtrl.addressTypeError.value,
                        hintText: "Home",
                        onChanged: widgetCtrl.onAddressTypeSelected,
                        selectedOption: widgetCtrl.selectedAddressType.value,
                        isExpanded: true,
                        options: widgetCtrl.addressTypes,
                        borderColor: FYColors.lighterBlack2,
                        hideIcon: false,
                      ),
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k24)),
                  FYTextButton(
                    text: "Add Address",
                    onPressed: widgetCtrl.addNewAddress,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
