import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYBackButton extends StatelessWidget {
  const FYBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYFlatButton(
      child: SvgPicture.asset(
        Images.back,
        height: sh(Dimens.k40),
        width: sw(Dimens.k40),
      ),
      backgroundColor: Colors.transparent,
      onPressed: pop,
    );
  }
}
