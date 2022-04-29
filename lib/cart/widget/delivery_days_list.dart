import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/delivery_day_list_item.dart';
import 'package:food_yours_customer/common/model/delivery_day.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DeliveryDaysList extends StatelessWidget {
  final List<DeliveryDay> chefDeliveryDays;
  final int indexOfSelectedDay;
  final Function(int) onDeliveryDaySelected;

  const DeliveryDaysList({
    Key? key,
    required this.chefDeliveryDays,
    required this.indexOfSelectedDay,
    required this.onDeliveryDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: chefDeliveryDays.length,
      itemBuilder: (BuildContext buildContext, int index) => Obx(
        () => DeliveryDayListItem(
          onDeliveryDaySelected: onDeliveryDaySelected,
          isSelected: index == indexOfSelectedDay,
          deliveryDay: deliveryDays.value[index],
          index: index,
        ),
      ),
    );
  }
}
