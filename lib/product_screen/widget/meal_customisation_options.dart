import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class MealCustomizationOptions extends StatelessWidget {
  final List<FYOptionItem> listItems;
  final Function(FYOptionItem index) onSelected;
  final Set<FYOptionItem> selectedItems;

  MealCustomizationOptions({
    this.listItems = const [],
    required this.onSelected,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: listItems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        leading: Mulish600Text(
          text: "${listItems[index].name}",
          color: FYColors.darkerBlack7,
          fontSize: sh(Dimens.k16),
        ),
        trailing: Checkbox(
          value: selectedItems.contains(listItems[index]),
          onChanged: (_) => onSelected(listItems[index]),
        ),
        onTap: () => onSelected(listItems[index]),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 0.4, height: 0),
    );
  }
}
