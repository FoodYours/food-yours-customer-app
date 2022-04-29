import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/screen/cart_tab.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/dashboard/controller/dashboard_screen_controller.dart';
import 'package:food_yours_customer/dashboard/widget/fy_tab_bar.dart';
import 'package:food_yours_customer/home/screen/home_tab.dart';
import 'package:food_yours_customer/orders/screen/order_tab.dart';
import 'package:food_yours_customer/user/profile/screen/profile_tab.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class DashboardScreen extends StatelessWidget {
  final DashBoardScreenController widgetCtrl =
      Get.put(DashBoardScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widgetCtrl.willPop,
      child: Obx(
        () => FYLoader(
          isLoading: widgetCtrl.isLoading.value,
          message: widgetCtrl.loadingMessage.value,
          child: Scaffold(
            body: TabBarView(controller: widgetCtrl.tabController, children: [
              HomeTab(),
              OrdersTab(),
              CartTab(),
              ProfileTab(),
            ]),
            bottomNavigationBar: FYTabBar(widgetCtrl),
          ),
        ),
      ),
    );
  }
}
