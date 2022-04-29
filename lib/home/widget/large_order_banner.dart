import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/controller/home_tab_front_panel_controller.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/instance_manager.dart';

class LargeOrderBanner extends StatelessWidget {
  final HomeTabFrontPanelController widgetCtrl =
      Get.put(HomeTabFrontPanelController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      height: sh(220),
      margin: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.large_order_banner),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.75), BlendMode.darken),
          ),
          borderRadius: BorderRadius.circular(9.85)),
      child: Column(
        children: [
          SizedBox(
            height: sh(Dimens.k24),
          ),
          Mulish700Text(
            text: "Do you have an event \ncoming up?",
            textAlign: TextAlign.center,
            color: Colors.white,
            fontSize: Dimens.k19,
          ),
          SizedBox(
            height: sh(Dimens.k16),
          ),
          Mulish400Text(
            text: "You can order for your food and pastries here",
            textAlign: TextAlign.center,
            color: Colors.white,
            fontSize: Dimens.k12,
          ),
          SizedBox(
            height: sh(Dimens.k32),
          ),
          Center(
            child: FYTextButton(
              text: "Order Now",
              textColor: FYColors.mainRed,
              backgroundColor: Colors.white,
              size: Size(Dimens.k136, Dimens.k47),
              onPressed: widgetCtrl.gotoLargeOrderScreen,
            ),
          ),
        ],
      ),
    );
  }
}
