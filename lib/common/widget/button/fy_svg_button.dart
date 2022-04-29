import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYSvgButton extends StatelessWidget {
  final String svgPicture;
  final Function()? onPressed;
  final double svgSize;
  final double splashRadius;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  const FYSvgButton({
    Key? key,
    required this.svgPicture,
    this.onPressed,
    this.svgSize = Dimens.k24,
    this.splashRadius = Dimens.k20,
    this.padding = const EdgeInsets.all(8.0),
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return IconButton(
      padding: padding,
      constraints: constraints,
      icon: SvgPicture.asset(
        svgPicture,
        width: sw(svgSize),
        height: sh(svgSize),
      ),
      splashRadius: sh(splashRadius),
      onPressed: onPressed,
    );
  }
}
