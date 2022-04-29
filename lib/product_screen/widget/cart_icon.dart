// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/fy_circle_image.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartIcon extends StatelessWidget {
  final Function() onCartPressed;
  final AnimationController animationCtrl;
  final Animation<double> animation;

  const CartIcon({
    Key? key,
    required this.onCartPressed,
    required this.animationCtrl,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return SizedBox(
      width: sw(Dimens.k80),
      height: sh(Dimens.k40),
      child: FYFlatButton(
        backgroundColor: Colors.transparent,
        onPressed: onCartPressed,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            SvgPicture.asset(
              Images.cart,
              height: sh(Dimens.k40),
              width: sw(Dimens.k40),
            ),
            Positioned(
              right: sw(Dimens.k0),
              top: sh(Dimens.k3),
              child: ValueListenableBuilder<Box>(
                valueListenable:
                    Hive.box(Strings.RANDOM_INFORMATION_BOX).listenable(),
                builder: (context, box, _) {
                  int cartItemsCount = box.get(Strings.CART_ITEMS_COUNT) ?? 0;
                  if (cartItemsCount > 0) {
                    animationCtrl.forward();
                  } else {
                    animationCtrl.reverse();
                  }
                  return ScaleTransition(
                    scale: animation,
                    child: FYCircleImage(
                      backgroundColor: FYColors.mainRed,
                      imageRadius: Dimens.k11,
                      child: Mulish700Text(
                        text: "${cartItemsCount == 0 ? "" : cartItemsCount}",
                        fontSize: Dimens.k14,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
