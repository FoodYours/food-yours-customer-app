import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYTwinButton extends StatelessWidget {
  final bool isSuccess;
  final Color firstBtnColor;
  final String firstBtnText;
  final Color secondBtnColor;
  final String secondBtnText;
  final Color firstBtnTextColor;
  final bool spaced;
  final Function()? firstBtnAction;
  final Function()? secondBtnAction;

  FYTwinButton(
      {this.isSuccess = true,
      this.firstBtnText = "",
      this.firstBtnTextColor = const Color(0xFF6C6E90),
      this.firstBtnColor = Colors.white,
      this.secondBtnText = "",
      this.spaced = false,
      this.secondBtnColor = const Color(0xFFE20612),
      this.firstBtnAction,
      this.secondBtnAction});

  @override
  Widget build(BuildContext context) {
    final Function sw = sWidth(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: FYTextButton(
          text: firstBtnText,
          onPressed: pop,
          textColor: firstBtnTextColor,
          backgroundColor: firstBtnColor,
          textDecoration: TextDecoration.underline,
        ),
      ),
      SizedBox(width: sw(spaced ? 8.13 : 0.0)),
      isSuccess
          ? Container()
          : Center(
              child: FYTextButton(
                text: secondBtnText,
                onPressed: secondBtnAction,
                backgroundColor: secondBtnColor,
              ),
            ),
    ]);
  }
}
