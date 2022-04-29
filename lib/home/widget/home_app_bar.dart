import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_icon_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/user/view_model/user_view_model.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/instance_manager.dart';

class HomeAppBar extends StatelessWidget {
  final HomeTabController widgetController = Get.put(HomeTabController());

  final UserViewModel user;

  HomeAppBar(this.user);

  @override
  Widget build(BuildContext context) {
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Mulish700Text(
              text: "Hello, ${user.firstName}",
              fontSize: Dimens.k16,
            ),
            Mulish400Text(
              text: "What would you like to order?",
              fontSize: Dimens.k12,
            ),
          ]),
          Expanded(child: Container()),
          FYIconButton(
            icon: FYIcons.search,
            color: FYColors.darkerBlack2,
            onPressed: widgetController.openSearchBackDrop,
          ),
          SizedBox(width: sw(Dimens.k48)),
          FYIconButton(
            icon: FYIcons.bell,
            color: FYColors.darkerBlack2,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
