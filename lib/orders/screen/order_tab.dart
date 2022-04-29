import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/dashboard/controller/dashboard_screen_controller.dart';
import 'package:food_yours_customer/orders/controller/orders_tab_controller.dart';
import 'package:food_yours_customer/orders/widget/order_card.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrdersTab extends StatelessWidget {
  final DashBoardScreenController dashboardCtrl = Get.find();
  final OrdersTabController widgetCtrl = Get.put(OrdersTabController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(
            preferredSize: Size(20, sh(46.41)),
            child: PrimaryAppBar(
              title: "My Orders",
              fontSize: Dimens.k19,
              backAction: dashboardCtrl.willPop,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sh(Dimens.k16),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
                child: Mulish600Text(
                  text: "Ongoing Order",
                  fontSize: sh(Dimens.k16),
                  color: FYColors.mainBlue,
                ),
              ),
              Expanded(
                flex: 30,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k18)),
                  child: ValueListenableBuilder<Box>(
                      valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                      builder: (context, box, _) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              OrderCard(
                            box.getAt(index),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: sh(Dimens.k24)),
                          itemCount: box.values.length,
                        );
                      }),
                ),
              ),
              SizedBox(height: sh(Dimens.k24)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
                child: Mulish600Text(
                  text: "Order History",
                  fontSize: sh(Dimens.k16),
                  color: FYColors.darkerBlack2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
                child: Mulish400Text(
                  text: "Re-order your favourite meals here",
                  fontSize: sh(Dimens.k12),
                  color: FYColors.lighterBlack2,
                ),
              ),
              SizedBox(height: sh(Dimens.k8)),
              Expanded(
                flex: 70,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k18)),
                  child: ValueListenableBuilder<Box>(
                      valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                      builder: (context, box, _) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              OrderCard(
                            box.getAt(index),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: sh(Dimens.k24),
                          ),
                          itemCount: box.values.length,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
