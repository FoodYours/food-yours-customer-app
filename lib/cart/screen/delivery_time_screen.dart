// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/delivery_time_controller.dart';
import 'package:food_yours_customer/cart/widget/delivery_days_list.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class DeliveryTimeScreen extends StatelessWidget {
  final DeliveryTimeScreenController widgetCtrl =
      Get.put(DeliveryTimeScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYLoader(
      child: Container(
          color: FYColors.lighterBlack2,
          child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: PreferredSize(
                preferredSize: Size(sw(Dimens.k20), sh(Dimens.k46_41)),
                child: SecondaryAppBar(title: 'Change Delivery Date/Time')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sh(Dimens.k25),
                    ),
                    Mulish700Text(
                      text: "Day of Delivery",
                      fontSize: sh(Dimens.k16),
                      color: FYColors.darkerBlack2,
                    ),
                    SizedBox(
                      height: sh(Dimens.k12),
                    ),
                    Obx(
                      () => Expanded(
                        child: DeliveryDaysList(
                          chefDeliveryDays: widgetCtrl.chefDeliveryDays.value,
                          indexOfSelectedDay:
                              widgetCtrl.indexOfSelectedDay.value,
                          onDeliveryDaySelected:
                              widgetCtrl.onDeliveryDaySelected,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sh(Dimens.k11),
                    ),
                    Mulish700Text(
                      text: "Time of Delivery",
                    ),
                    SizedBox(
                      height: sh(Dimens.k16),
                    ),
                    Obx(
                      () => InputFieldWrapper(
                        labelText: "Select a timeframe",
                        child: FYButton(
                          onTap: () => widgetCtrl.onTimeSelected(),
                          child: SecondaryTextField(
                            enabled: false,
                            hintTextColor: FYColors.darkerBlack2,
                            controller: widgetCtrl.deliveryTimeTextController,
                            hintText: "12PM - 1PM",
                            errorMessage: widgetCtrl.deliverTimeError.value,
                            suffixIcon: Icon(FYIcons.chevron_down),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sh(Dimens.k32),
                    ),
                    Center(
                      child: FYTextButton(
                        text: "Save and Continue",
                        onPressed: widgetCtrl.validateInputs,
                      ),
                    ),
                    SizedBox(
                      height: sh(Dimens.k32),
                    ),
                  ]),
            ),
          )),
    );
  }
}
