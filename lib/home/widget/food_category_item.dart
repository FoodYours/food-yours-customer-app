import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';

class FoodCategoryItem extends StatelessWidget {
  final FoodCategoryViewModel foodCategory;
  final Function(int index, FoodCategoryViewModel foodCategory)? onSelected;
  final bool? isSelected;
  final int index;

  FoodCategoryItem(
    this.foodCategory, {
    this.isSelected = false,
    this.onSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYFlatButton(
      onPressed:
          onSelected == null ? null : () => onSelected!(index, foodCategory),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.k4),
                border: Border.all(
                    color:
                        isSelected! ? FYColors.mainGreen : Colors.transparent)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.k4),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.darken),
                child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: Images.popular_chef,
                  image: foodCategory.categoryImage,
                  fit: BoxFit.fill,
                  imageErrorBuilder: (c, o, t) => Image.asset(
                    Images.popular_chef,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              foodCategory.name,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.button!.copyWith(
                  fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sw(Dimens.k3_5),
        vertical: sh(Dimens.k2_5),
      ),
    );
  }
}
