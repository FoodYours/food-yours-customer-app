import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/orders/controller/orders_tab_controller.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class OrderCard extends StatelessWidget {
  final widgetCtrl = Get.find<OrdersTabController>();

  final CartModel cartItem;

  OrderCard(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYFlatButton(
      onPressed: () => widgetCtrl.gotoOrderSummaryScreen(cartItem),
      backgroundColor: Colors.transparent,
      child: Container(
        height: sh(Dimens.k98),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k8)),
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.01),
                blurRadius: 8,
                offset: Offset(0, 1))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: sh(Dimens.k82),
                    width: sh(Dimens.k86),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.k4),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.chef,
                        image: cartItem.chefImageUrl,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (c, o, t) => Image.asset(
                          Images.chef,
                          height: sh(Dimens.k141_18),
                          width: sh(Dimens.k142),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k7)),
                  Container(
                    width: sw(Dimens.k212),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style:
                                  context.theme.textTheme.headline2!.copyWith(
                                color: FYColors.lighterBlack2,
                                fontSize: sh(Dimens.k12),
                              ),
                              text: "Order Items: ",
                            ),
                            TextSpan(
                              style:
                                  context.theme.textTheme.headline2!.copyWith(
                                color: FYColors.darkerBlack2,
                                fontSize: sh(Dimens.k12),
                              ),
                              text:
                                  "${cartItem.quantity["name"]} ${cartItem.supplements.isNotEmpty ? cartItem.supplements.first["name"] : ""}, ${cartItem.extras.isNotEmpty ? cartItem.extras.first["name"] : ""}",
                            ),
                          ]),
                        ),
                        SizedBox(height: sh(Dimens.k8)),
                        RichText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style:
                                  context.theme.textTheme.headline2!.copyWith(
                                color: FYColors.lighterBlack2,
                                fontSize: sh(Dimens.k12),
                              ),
                              text: "Price: ",
                            ),
                            TextSpan(
                              style:
                                  context.theme.textTheme.headline3!.copyWith(
                                color: FYColors.mainRed,
                                fontSize: sh(Dimens.k12),
                              ),
                              text: cartItem.total.toString(),
                            ),
                          ]),
                        ),
                        SizedBox(height: sh(8)),
                        RichText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style:
                                  context.theme.textTheme.headline2!.copyWith(
                                color: FYColors.lighterBlack2,
                                fontSize: sh(Dimens.k12),
                              ),
                              text: "Chef: ",
                            ),
                            TextSpan(
                              style: context.theme.textTheme.caption!.copyWith(
                                  fontSize: Dimens.k12,
                                  fontWeight: FontWeight.w400,
                                  color: FYColors.darkerBlack2),
                              text:
                                  "${cartItem.chefName} AaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAA",
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
