import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class Article extends StatelessWidget {
  final String title;
  final String description;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final double? spaceBetween;

  Article(
      {this.title = "",
      this.description = "",
      this.titleFontSize = 16,
      this.descriptionFontSize = 16,
      this.spaceBetween = 4});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Mulish700Text(
          text: title,
          fontSize: sh(titleFontSize ?? Dimens.k16),
        ),
        SizedBox(height: sh(spaceBetween ?? Dimens.k4)),
        Mulish400Text(
          text: description,
          maxLines: 2,
          fontSize: sh(descriptionFontSize ?? Dimens.k16),
        ),
      ],
    );
  }
}
