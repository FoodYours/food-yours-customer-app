import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ChefCircularImage extends StatelessWidget {
  final String chefImage;
  final double backgroundDiameter;
  final double foregroundDiameter;

  const ChefCircularImage({
    Key? key,
    required this.chefImage,
    this.backgroundDiameter = Dimens.k45,
    this.foregroundDiameter = Dimens.k40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: sh(backgroundDiameter),
          width: sw(backgroundDiameter),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: FadeInImage.assetNetwork(
            placeholder: Images.chef,
            image: chefImage,
            fit: BoxFit.cover,
            height: sh(foregroundDiameter),
            width: sw(foregroundDiameter),
            imageErrorBuilder: (c, o, t) => Image.asset(
              Images.chef,
              width: sw(foregroundDiameter),
              height: sh(foregroundDiameter),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
