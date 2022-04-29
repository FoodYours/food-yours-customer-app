import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;

  final void Function(String)? onChanged;

  final TextInputType? keyboardType;

  final bool obscureText;

  final String? errorMessage;

  final FocusNode? focusNode;

  final TextEditingController? controller;

  final bool enabled;

  final List<TextInputFormatter>? inputFormatters;

  final bool enableInteractiveSelection;

  final double borderRadius;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final bool isTransparentBorder;

  final Color? textColor;

  final TextCapitalization textCapitalization;

  final String? labelText;

  final int maxLength;

  PrimaryTextField(
      {this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.keyboardType,
      this.errorMessage,
      this.controller,
      this.focusNode,
      this.borderRadius = 6.0,
      this.enabled = true,
      this.inputFormatters,
      this.enableInteractiveSelection = true,
      this.obscureText = false,
      this.isTransparentBorder = false,
      this.textCapitalization = TextCapitalization.none,
      this.textColor,
      this.maxLength = TextField.noMaxLength,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);

    return TextField(
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: enabled,
      textCapitalization: textCapitalization,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: context.theme.textTheme.headline2!
          .copyWith(fontSize: Dimens.k12, color: FYColors.darkerBlack2),
      decoration: InputDecoration(
        labelText: labelText,
        errorText:
            errorMessage == "" || errorMessage == null ? null : errorMessage,
        counterText: "",
        errorStyle: context.theme.textTheme.headline4!
            .copyWith(fontSize: sh(Dimens.k12), color: FYColors.mainOrange),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
