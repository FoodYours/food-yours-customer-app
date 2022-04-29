// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChefNameAndRatingColumn extends StatelessWidget {
  const ChefNameAndRatingColumn({
    Key? key,
    required this.mealViewModel,
  }) : super(key: key);

  final MealSearchViewModel mealViewModel;

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AutoSizeText(
          mealViewModel.chefName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.headline1!.copyWith(
            color: FYColors.lighterBlack2,
            fontSize: sh(Dimens.k16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              FYIcons.star,
              color: context.theme.textTheme.headline3!.color,
              size: sh(Dimens.k16),
            ),
            SizedBox(
              height: sh(5.33),
            ),
            Text(
              "${mealViewModel.rating}(22)",
              textAlign: TextAlign.end,
              style: context.theme.textTheme.headline3!
                  .copyWith(fontSize: Dimens.k12),
            )
          ],
        ),
      ],
    );
  }
}
