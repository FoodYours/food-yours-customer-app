import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/orders/controller/order_rating_screen_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class OrderRatingScreen extends StatelessWidget {
  final OrderRatingScreenController widgetCtrl = OrderRatingScreenController();

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Container(
          color: context.theme.backgroundColor,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(20, sh(46.41)),
                child: SecondaryAppBar(title: "Rate Your Order")),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: sw(24)),
              children: [
                SizedBox(height: sh(14)),
                Text("*Please do away with cyberbullying of any sort..",
                    style: context.theme.textTheme.headline3!.copyWith(
                      fontSize: sh(12),
                      fontWeight: FontWeight.w600,
                      color: FYColors.lighterBlack2,
                    )),
                SizedBox(height: sh(24)),
                Text("Review your order",
                    style: context.theme.textTheme.headline3!.copyWith(
                      fontSize: sh(14),
                      fontWeight: FontWeight.w600,
                      color: FYColors.darkerBlack2,
                    )),
                SizedBox(height: sh(7)),
                Obx(() => SecondaryTextField(
                    maxLines: 7,
                    controller: widgetCtrl.remarkTextCtrl,
                    onChanged: widgetCtrl.clearRemarkError,
                    errorMessage: widgetCtrl.remarkError.value,
                    hintText: "Type something",
                    hintTextColor: FYColors.subtleBlack)),
                SizedBox(height: sh(25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Chef Rating:",
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: Dimens.k12,
                            fontWeight: FontWeight.w400,
                            color: FYColors.darkerBlack)),
                    SizedBox(width: sw(11)),
                    Obx(() => Row(
                            children: List.generate(
                          5,
                          (int index) => Row(
                            children: [
                              FYButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FYIcons.star_outline,
                                        size: Dimens.k20,
                                        color: index <= widgetCtrl.rating.value
                                            ? FYColors.mainOrange
                                            : FYColors.mainBlue),
                                  ),
                                  onTap: () =>
                                      widgetCtrl.onRatingSelected(index))
                            ],
                          ),
                        )))
                  ],
                ),
                SizedBox(height: sh(68.98)),
                Center(
                  child: FYTextButton(
                    text: "Rate Chef",
                    onPressed: widgetCtrl.validateInput,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
