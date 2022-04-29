import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/delivery_detail_item.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class DeliveryDetailsSection extends StatelessWidget {
  final String address;
  final Function() gotoChangeAddressScreen;
  final String recipientNumber;
  final String deliveryDate;
  final Function() gotoChangeDeliveryTimeScreen;

  const DeliveryDetailsSection({
    Key? key,
    required this.address,
    required this.gotoChangeAddressScreen,
    required this.recipientNumber,
    required this.deliveryDate,
    required this.gotoChangeDeliveryTimeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k24),
          ),
          child: Mulish600Text(
            text: "Delivery Details",
            fontSize: Dimens.k16,
            color: FYColors.darkerBlack2,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k24),
            vertical: sh(Dimens.k12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveryDetailItem(
                leading: "Address:",
                title: address /* "23 Barnawa, Kaduna Nigeria." */,
              ),
              DeliveryDetailItem(
                titleWidget: Align(
                  alignment: Alignment.centerLeft,
                  child: FYFlatButton(
                    child: Mulish600Text(
                      text: "Tap to Change",
                      color: FYColors.mainBlue,
                      fontSize: sh(Dimens.k12),
                    ),
                    size: Size(Dimens.k0, Dimens.k0),
                    onPressed: gotoChangeAddressScreen,
                  ),
                ),
              ),
              DeliveryDetailItem(
                leading: "Contact:",
                title: recipientNumber,
              ),
              DeliveryDetailItem(
                leading: "Date & Time:",
                title: deliveryDate,
              ),
              DeliveryDetailItem(
                titleWidget: Align(
                  alignment: Alignment.centerLeft,
                  child: FYFlatButton(
                    child: Mulish600Text(
                      text: "Tap to Edit",
                      color: FYColors.mainBlue,
                      fontSize: sh(Dimens.k12),
                    ),
                    size: Size(Dimens.k0, Dimens.k0),
                    onPressed: gotoChangeDeliveryTimeScreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
