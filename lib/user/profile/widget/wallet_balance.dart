import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/twin_buttons.dart';
import 'package:food_yours_customer/fund_wallet/screen/fund_wallet.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/route_manager.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WalletBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: sh(11)),
          height: sh(130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Wallet Balance",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(12))),
              SizedBox(height: sh(4.0)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(12)),
                    text: "N ",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: sh(Dimens.k24),
                        fontWeight: FontWeight.w700,
                        color: FYColors.mainBlue),
                    text: "269,550 ",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: sh(Dimens.k12),
                        fontWeight: FontWeight.w400,
                        color: FYColors.mainBlue),
                    text: ".00",
                  ),
                ]),
              ),
              SizedBox(height: sh(4.0)),
              FYTwinButton(
                  isSuccess: false,
                  firstBtnText: "Withdraw",
                  firstBtnTextColor: FYColors.mainBlue,
                  firstBtnColor: FYColors.subtleBlue2,
                  secondBtnText: "Fund Wallet",
                  firstBtnAction: () {},
                  secondBtnAction: () => Get.to(() => FundWalletScreen()),
                  spaced: true,
                  secondBtnColor: FYColors.mainBlue)
            ],
          ),
        ),
      ),
    );
  }
}
