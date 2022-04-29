import 'package:flutter/material.dart';
import 'package:food_yours_customer/dashboard/view_model/tab_info.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYTab extends StatelessWidget {
  final TabInfoViewModel tabInfoViewModel;

  FYTab(this.tabInfoViewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FYTabIndicator(tabInfoViewModel),
        Tab(icon: tabInfoViewModel.tabIcon, text: tabInfoViewModel.tabText),
      ],
    );
  }
}

class FYTabIndicator extends StatelessWidget {
  final TabInfoViewModel tabInfoViewModel;

  FYTabIndicator(this.tabInfoViewModel);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      width: sw(Dimens.k27),
      height: sh(Dimens.k2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.k4),
          color: tabInfoViewModel.isSelected
              ? Theme.of(context).tabBarTheme.labelColor
              : Colors.transparent),
    );
  }
}
