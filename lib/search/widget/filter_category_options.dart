import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FilterListItem extends StatelessWidget {
  final List listItems;
  final Function(int index) onSelected;
  final int selectedIndex;

  FilterListItem(
      {this.listItems = const [],
      required this.onSelected,
      this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Column(
      children: List.generate(
        listItems.length,
        (index) => ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: Checkbox(
              value: index == selectedIndex,
              onChanged: (_) => onSelected(index),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
          title: Mulish400Text(
            text: listItems[index].name,
            fontSize: sh(Dimens.k16),
            color: FYColors.darkerBlack2,
          ),
          onTap: () => onSelected(index),
        ),
      ),
    );
  }
}
