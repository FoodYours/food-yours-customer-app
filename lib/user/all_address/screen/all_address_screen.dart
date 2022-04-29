import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/user/all_address/controller/all_address_controller.dart';
import 'package:food_yours_customer/user/all_address/widget/address_item.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class AllAddressesScreen extends StatelessWidget {
  final AllAddressesController widgetCtrl = Get.put(AllAddressesController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
          preferredSize: Size(sw(Dimens.k20), sh(Dimens.k46_41)),
          child: SecondaryAppBar(
            title: "My Addresses",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sh(Dimens.k24)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
              child: Text("You can have up to 4 saved addresses",
                  style: context.theme.textTheme.headline4!
                      .copyWith(fontSize: sh(Dimens.k12))),
            ),
            SizedBox(height: sh(Dimens.k8)),
            Expanded(
              child: Obx(() => ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: sw(Dimens.k24),
                    ),
                    children: [
                      widgetCtrl.addressViewModel.value.address == ""
                          ? SizedBox()
                          : AddressItem(
                              address:
                                  widgetCtrl.addressViewModel.value.address,
                              addressType: "Home",
                              onAddressSelected: widgetCtrl.onAddressSelected,
                              selectedAddress: widgetCtrl.addressType.value,
                            ),
                      SizedBox(
                        height: sh(Dimens.k16),
                      ),
                      widgetCtrl.addressViewModel.value.workAddress == ""
                          ? SizedBox()
                          : AddressItem(
                              address:
                                  widgetCtrl.addressViewModel.value.workAddress,
                              addressType: "Work",
                              onAddressSelected: widgetCtrl.onAddressSelected,
                              selectedAddress: widgetCtrl.addressType.value,
                            ),
                      SizedBox(
                        height: sh(Dimens.k16),
                      ),
                      widgetCtrl.addressViewModel.value.otherAddress == ""
                          ? SizedBox()
                          : AddressItem(
                              address: widgetCtrl
                                  .addressViewModel.value.otherAddress,
                              addressType: "Others",
                              onAddressSelected: widgetCtrl.onAddressSelected,
                              selectedAddress: widgetCtrl.addressType.value,
                            ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
