import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/model/delivery_day.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class DeliveryDayListItem extends StatelessWidget {
  final Function(int)? onDeliveryDaySelected;
  final DeliveryDay deliveryDay;
  final bool isSelected;
  final int index;

  const DeliveryDayListItem({
    Key? key,
    required this.onDeliveryDaySelected,
    required this.deliveryDay,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      dense: true,
      onTap: deliveryDay.enabled ? () => onDeliveryDaySelected!(index) : null,
      leading: Checkbox(
        value: isSelected,
        onChanged:
            deliveryDay.enabled ? (_) => onDeliveryDaySelected!(index) : null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      title: Mulish400Text(
        text: "${deliveryDay.dayOfWeek}",
        fontSize: sh(Dimens.k16),
        color:
            deliveryDay.enabled ? FYColors.darkerBlack2 : FYColors.subtleBlack3,
      ),
    );
  }
}
