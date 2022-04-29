import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/dashboard/controller/dashboard_screen_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class PrimaryAppBar extends PreferredSize {
  final DashBoardScreenController widgetCtrl = Get.find();

  final bool? showBackBtn;
  final String title;
  final double? elevation;
  final Function()? backAction;
  final double fontSize;

  PrimaryAppBar({
    this.showBackBtn = true,
    required this.title,
    this.elevation = 8.0,
    this.fontSize = Dimens.k24,
    this.backAction,
  }) : super(preferredSize: const Size(20, 50.41), child: const SizedBox());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      title: Mulish600Text(
        text: title,
        fontSize: fontSize,
        color: FYColors.darkerBlack2,
      ),
      leading: IconButton(
          icon: Icon(FYIcons.chevron_left),
          onPressed: backAction ?? () => pop()),
      elevation: elevation,
      shadowColor: Color.fromRGBO(0, 99, 247, 0.1),
      foregroundColor: FYColors.darkerBlack2,
    );
  }
}
