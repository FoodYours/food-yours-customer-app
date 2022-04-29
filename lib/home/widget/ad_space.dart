import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/fy_outline_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class AdSpace extends StatelessWidget {
  final Function? adAction;

  AdSpace([this.adAction]);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: SvgPicture.asset(
            Images.ad_banner,
            fit: BoxFit.fitWidth,
            height: sh(Dimens.k89),
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(left: sw(Dimens.k15), right: sw(Dimens.k19)),
          height: sh(Dimens.k89),
          width: double.infinity,
          child: buildAdContent(context, sw, sh),
        ),
      ],
    );
  }

  Row buildAdContent(BuildContext context, Function sw, Function sh) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mulish700Text(
              text: "Free delivery on orders \nabove N7K",
              fontSize: Dimens.k16,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          width: sw(17),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FYOutlinedButton(
                text: "Start Ordering",
                textSize: Dimens.k8,
                backgroundColor: FYColors.mainRed,
                textColor: Colors.white,
                size: Size(double.infinity, Dimens.k32),
                borderColor: Colors.white,
                onPressed: () => adAction == null ? null : adAction!(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
