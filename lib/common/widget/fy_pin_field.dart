import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pinput/pin_put/pin_put.dart';

class FYPinField extends StatelessWidget {
  final int fieldsCount;
  final TextEditingController controller;
  final Function(String)? onSubmit;
  final bool useNativeKeyboard;

  const FYPinField({
    Key? key,
    this.fieldsCount = Integers.k5,
    required this.controller,
    this.useNativeKeyboard = true,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(
        color: FYColors.lighterBlack2,
      ),
    );
    return PinPut(
      useNativeKeyboard: useNativeKeyboard,
      autovalidateMode: AutovalidateMode.always,
      withCursor: true,
      fieldsCount: fieldsCount,
      onSubmit: onSubmit,
      fieldsAlignment: MainAxisAlignment.spaceBetween,
      textStyle: context.theme.textTheme.headline1!.copyWith(
        color: FYColors.lighterBlack2,
        fontSize: sh(Dimens.k18),
      ),
      separator: SizedBox(width: sw(Dimens.k6)),
      eachFieldWidth: sw(Dimens.k48),
      eachFieldHeight: sh(Dimens.k48),
      controller: controller,
      preFilledWidget: Mulish600Text(
        text: "0",
        color: FYColors.lighterBlack4,
      ),
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      inputDecoration: const InputDecoration()
          .applyDefaults(
            context.theme.inputDecorationTheme.copyWith(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: Dimens.k05,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: Dimens.k05,
                ),
              ),
              fillColor: Colors.transparent,
            ),
          )
          .copyWith(
            counterText: "",
          ),
      followingFieldDecoration: pinPutDecoration.copyWith(
        border: Border.all(
          color: FYColors.lighterBlack2,
        ),
      ),
      pinAnimationType: PinAnimationType.scale,
    );
  }
}
