import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class SecondaryAppBar extends StatelessWidget {
  final bool? showBackBtn;
  final String title;
  final double? elevation;
  final Function()? backAction;

  SecondaryAppBar(
      {this.showBackBtn = true,
      required this.title,
      this.elevation = 8.0,
      this.backAction});
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sHeight(context);

    return AppBar(
      backgroundColor: FYColors.lighterBlack2,
      title: Mulish600Text(
        text: title,
        fontSize: sh(Dimens.k16),
        color: Colors.white,
      ),
      leading: FYFlatButton(
        child: SvgPicture.asset(
          Images.back,
          height: sh(Dimens.k40),
          width: sw(Dimens.k40),
        ),
        backgroundColor: Colors.transparent,
        onPressed: pop,
      ),
      elevation: elevation,
      shadowColor: Color.fromRGBO(0, 99, 247, 0.1),
      foregroundColor: Colors.white,
    );
  }
}
