import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/orders/controller/order_tracking_sreen_controller.dart';
import 'package:food_yours_customer/orders/widget/progress_tracker.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class OrderTrackingScreen extends StatelessWidget {
  final OrderTrackingScreenController widgetCtrl =
      Get.put(OrderTrackingScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(20, sh(46.41)),
            child: SecondaryAppBar(title: "Track Order")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(23)),
            children: [
              SizedBox(height: sh(24)),
              Text(
                "Track Order",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: Dimens.k16,
                    fontWeight: FontWeight.w700,
                    color: FYColors.darkerBlack2),
              ),
              Text(
                "ID: O4848490",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: Dimens.k12,
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack),
              ),
              SizedBox(height: sh(8)),
              Divider(height: 0, thickness: 1),
              SizedBox(height: sh(24)),
              Text(
                "Status",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: Dimens.k16,
                    fontWeight: FontWeight.w700,
                    color: FYColors.darkerBlack),
              ),
              SizedBox(height: sh(12)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          5,
                          (int index) => index == 4
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(Images.success_check),
                                    SizedBox(width: 14.0),
                                    ProgressIndicatorText()
                                  ],
                                )
                              : ProgressTracker()))),
              SizedBox(height: sh(8)),
              Text(
                "* Please crosscheck order before confirming a delivery.",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline3!
                    .copyWith(fontSize: sh(12), fontWeight: FontWeight.w400),
              ),
              SizedBox(height: sh(24)),
              Center(
                child: FYTextButton(
                  text: "Scan Driver’s QR-Code",
                  onPressed: widgetCtrl.gotoQrCodeScreen,
                ),
              ),
            ]),
      ),
    );
  }
}
