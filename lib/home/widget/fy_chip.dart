// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';

class FYChip extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hideDeleteButton;
  final void Function()? onDeleted;

  FYChip(this.text,
      {this.backgroundColor,
      this.textColor,
      this.hideDeleteButton = true,
      this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        deleteIcon: Icon(FYIcons.x, size: Dimens.k16),
        onDeleted: hideDeleteButton ? null : onDeleted,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Mulish600Text(
              text: text,
              fontSize: Dimens.k12,
              color: textColor ?? FYColors.mainBlue,
            ),
          ],
        ));
  }
}
