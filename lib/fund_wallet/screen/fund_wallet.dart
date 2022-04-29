import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/fund_wallet/widget/credit_card_front.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FundWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(sw(20), sh(46.41)),
            child: SecondaryAppBar(title: "Fund Wallet")),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          children: [
            SizedBox(height: sh(32)),
            Stack(
              children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL, // default
                  front: CreditCardFront(),
                  back: CreditCardBack(),
                ),
                Positioned(
                    bottom: 4,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Divider(
                            thickness: 20, color: FYColors.subtleBlue7))),
              ],
            ),
            SizedBox(height: sh(32)),
            InputFieldWrapper(
              labelText: "Amount to topup",
              child: SecondaryTextField(
                  hintText: "0.00", hintTextColor: FYColors.subtleBlack),
            ),
            SizedBox(height: sh(16)),
            InputFieldWrapper(
              labelText: "Card Name",
              child: SecondaryTextField(
                  hintText: "John Doe", hintTextColor: FYColors.subtleBlack),
            ),
            SizedBox(height: sh(16)),
            InputFieldWrapper(
              labelText: "Card Number",
              child: SecondaryTextField(
                  hintText: "0000 0000 0000 0000",
                  hintTextColor: FYColors.subtleBlack),
            ),
            SizedBox(height: sh(16)),
            // InputFieldWrapper(
            //     labelText: "Expiry Date", child: SecondaryTextField(hintText: "12/25", hintTextColor: FYColors.subtleBlack)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InputFieldWrapper(
                        labelText: "Expiry Date",
                        child: SecondaryTextField(
                            hintText: "12/25",
                            hintTextColor: FYColors.subtleBlack)),
                  ),
                  SizedBox(width: sw(15)),
                  Expanded(
                    child: InputFieldWrapper(
                      labelText: "CVV",
                      child: SecondaryTextField(
                          hintText: "000", hintTextColor: FYColors.subtleBlack),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sh(32)),
            FYTextButton(
              text: "Fund My Wallet",
              onPressed: () {},
            ),
            SizedBox(height: sh(23)),
          ],
        ),
      ),
    );
  }
}
