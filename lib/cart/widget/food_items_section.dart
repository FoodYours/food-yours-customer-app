import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/order_quantity_item.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoodItemsSection extends StatelessWidget {
  final Function increaseItemQuantity;
  final Function decreaseItemQuantity;
  final Function onCartItemSelected;
  final int selectedFoodIndex;

  const FoodItemsSection({
    Key? key,
    required this.increaseItemQuantity,
    required this.decreaseItemQuantity,
    required this.onCartItemSelected,
    required this.selectedFoodIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          child: Mulish600Text(
            text: "Food Items",
            fontSize: Dimens.k16,
            color: FYColors.darkerBlack2,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k24),
          ),
          child: Column(
            children: [
              SizedBox(
                height: sh(Dimens.k27),
              ),
              ValueListenableBuilder<Box>(
                valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                builder: (context, box, _) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderQuantityItem(
                        cartItem: box.values.toList()[index],
                        indexOfCartItem: index,
                        increaseItemQuantity: increaseItemQuantity,
                        decreaseItemQuantity: decreaseItemQuantity,
                        onCartItemSelected: onCartItemSelected,
                        isSelected: index == selectedFoodIndex,
                      );
                    },
                    itemCount: box.values.length,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
