import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SquareImage extends StatelessWidget {
  final double height;
  final double width;

  SquareImage({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: context.theme.textTheme.button!.color,
            border: Border.all(
                color: context.theme.textTheme.button!.color!, width: 4.0),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage(Images.chef), fit: BoxFit.cover)));
  }
}
