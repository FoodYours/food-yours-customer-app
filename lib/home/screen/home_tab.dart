import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/primary_app_bar.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/screen/home_screen_back_panel.dart';
import 'package:food_yours_customer/home/screen/home_screen_front_panel.dart';
import 'package:food_yours_customer/home/widget/home_app_bar.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class HomeTab extends StatelessWidget {
  final HomeTabController widgetController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(20, sh(50.41)),
              child: Obx(() => widgetController.isShowHomeScreenAppbar.value
                  ? HomeAppBar()
                  : PrimaryAppBar(
                      title: "Search",
                      backAction: widgetController.closeSearchBackDrop,
                    ))),
          body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              child: Stack(
                children: <Widget>[
                  HomeScreenBackPanel(),
                  PositionedTransition(
                    rect: widgetController.getPanelAnimation(constraints),
                    child: HomeScreenFrontPanel(),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}