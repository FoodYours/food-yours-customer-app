import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/search/widget/chef_circular_image.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TimeLineImage extends StatelessWidget {
  final String timelineImage;
  final double height;
  final String? chefImage;
  final BlendMode blendMode;
  final Color filterColor;

  TimeLineImage({
    Key? key,
    required this.timelineImage,
    required this.height,
    this.chefImage,
    this.blendMode = BlendMode.color,
    this.filterColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return FlexibleSpaceBar(
      background: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Container(
            color: context.theme.backgroundColor,
            child: ClipRRect(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(filterColor, blendMode),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.search_result,
                  height: height,
                  width: context.width,
                  image: timelineImage,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (c, o, t) => Image.asset(
                    Images.search_result,
                    width: double.infinity,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimens.k8_83),
                bottomRight: Radius.circular(Dimens.k8_83),
              ),
            ),
          ),
          chefImage != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: ChefCircularImage(
                    chefImage: chefImage!,
                    backgroundDiameter: sh(Dimens.k150),
                    foregroundDiameter: sh(Dimens.k139),
                  ),
                )
              : SizedBox(width: Dimens.k0, height: Dimens.k0)
        ],
      ),
    );
  }
}
