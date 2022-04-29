import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChangePasswordScreen extends StatelessWidget {
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
            child: SecondaryAppBar(title: "Change Password")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
            children: [
              InputFieldWrapper(
                labelText: "Old Password",
                child: SecondaryTextField(
                  hintText: "****************",
                  hintTextColor: FYColors.subtleBlack,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Images.eye_off)),
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "New Password",
                child: SecondaryTextField(
                  hintText: "****************",
                  hintTextColor: FYColors.subtleBlack,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Images.eye_off)),
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Confirm New Password",
                child: SecondaryTextField(
                  hintText: "****************",
                  hintTextColor: FYColors.subtleBlack,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Images.eye_off)),
                ),
              ),
              SizedBox(height: sh(24)),
              FYTextButton(
                text: "Update",
                onPressed: () {},
              ),
            ]),
      ),
    );
  }
}
