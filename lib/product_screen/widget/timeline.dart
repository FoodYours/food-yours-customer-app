// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_yours_customer/product_screen/widget/timeline_image.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class Timeline extends StatelessWidget {
  final String timelineImage;
  final Function() onCartPressed;
  final AnimationController animationCtrl;
  final Animation<double> animation;
  final double height;
  final String? chefImage;

  Timeline({
    Key? key,
    required this.timelineImage,
    required this.onCartPressed,
    required this.animationCtrl,
    required this.animation,
    this.chefImage,
    this.height = Dimens.k295,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      leadingWidth: sw(Dimens.k80),
      expandedHeight: sh(height + (chefImage != null ? Dimens.k10 : Dimens.k0)),
      pinned: true,
      flexibleSpace: TimeLineImage(
        timelineImage: timelineImage,
        chefImage: chefImage!,
        height: height,
      ),
    );
  }
}
