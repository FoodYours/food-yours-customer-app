import 'package:flutter/material.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double borderRadius;
  final double height;
  final double width;

  ShimmerWidget(
      {this.borderRadius = 0,
      this.height = double.infinity,
      this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    final Function sw = sWidth(context);

    return Shimmer.fromColors(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sw(10)),
        decoration: BoxDecoration(
          color: Color(0xffeaf0f0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width,
        height: height,
      ),
      baseColor: Color(0xffeaf0f0),
      highlightColor: Colors.white,
    );
  }
}
