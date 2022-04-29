import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/dashboard/view_model/tab_info.dart';
import 'package:food_yours_customer/dashboard/widget/fy_tab.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FYTabBar extends StatelessWidget {
  final dynamic screenController;

  FYTabBar(
    this.screenController,
  );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 25,
      child: Obx(() {
        return TabBar(
            physics: NeverScrollableScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: screenController.tabController,
            tabs: buildTabs(context));
      }),
    );
  }

  buildTabs(BuildContext context) {
    return List.generate(
            screenController.tabDataList.length,
            (index) => TabInfoViewModel(
                screenController.currentTabIndex == index,
                SvgPicture.asset(screenController.tabDataList[index]["image"],
                    color: screenController.currentTabIndex == index
                        ? Theme.of(context).tabBarTheme.labelColor
                        : Theme.of(context).tabBarTheme.unselectedLabelColor),
                screenController.tabDataList[index]["label"]))
        .map((TabInfoViewModel tabInfoViewModel) => FYTab(tabInfoViewModel))
        .toList();
  }
}
