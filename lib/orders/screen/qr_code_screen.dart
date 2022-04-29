import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/orders/controller/qr_code_screen_controller.dart';

import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class QRCodeScreen extends StatelessWidget {
  final QRCodeScreenController widgetCtrl = Get.put(QRCodeScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(20, sh(46.41)),
            child: SecondaryAppBar(title: "Scan QR")),
        body: ListView(padding: EdgeInsets.zero, children: [
          Stack(
            children: [
              Image.asset(Images.qr_image,
                  height: sh(384), width: double.infinity),
              Image.asset(Images.qr_overlay,
                  height: sh(384), width: double.infinity),
            ],
          ),
          SizedBox(height: sh(24)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Having trouble scanning?",
                  style: context.theme.textTheme.caption!.copyWith(
                      fontSize: Dimens.k16,
                      fontWeight: FontWeight.w600,
                      color: FYColors.darkerBlack2),
                ),
                SizedBox(height: sh(8)),
                Text(
                  "Enter driver’s delivery ID manually to continue",
                  style: context.theme.textTheme.caption!.copyWith(
                      fontSize: Dimens.k12,
                      fontWeight: FontWeight.w400,
                      color: FYColors.darkerBlack),
                ),
                SizedBox(height: sh(16)),
                SecondaryTextField(
                  hintText: "Delivery ID",
                  hintTextColor: FYColors.subtleBlack7,
                ),
                SizedBox(height: sh(24)),
                Center(
                  child: LocalTheme(
                    child: FYTextButton(
                      text: "Submit and Verify",
                      onPressed: widgetCtrl.gotoChefRatingScreen,
                    ),
                    // buttonStyle:
                    //     subTextButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all<Color>(FYColors.lighterBlack2)),
                    buttonTextStyle: context.theme.textTheme.headline3!
                        .copyWith(
                            fontSize: Dimens.k16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
