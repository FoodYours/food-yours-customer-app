// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/fy_drop_down.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/special_order/controller/special_order_screen_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class SpecialOrderScreen extends StatelessWidget {
  final SpecialOrderScreenController widgetController =
      Get.put(SpecialOrderScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(
              preferredSize: Size(20, sh(46.41)),
              child: PrimaryAppBar(title: "Special order")),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              SizedBox(height: sh(30)),
              AutoSizeText(
                  "Order for anniversaries, house warming, new jobs etc.",
                  minFontSize: 4,
                  maxLines: 3,
                  style: context.theme.textTheme.headline4!.copyWith(
                      fontSize: sh(Dimens.k12), color: FYColors.darkerBlack3)),
              SizedBox(height: sh(48)),
              Text(
                "Requester Details",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w700,
                    color: FYColors.darkerBlack2),
              ),
              SizedBox(height: sh(24)),
              InputFieldWrapper(
                labelText: "Full Name",
                child: SecondaryTextField(
                    hintText: "Mike Aderongbe",
                    hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Email",
                child: SecondaryTextField(
                    hintText: "mikeaderongbe31@gmail.com",
                    hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Phone Number",
                child: SecondaryTextField(
                  hintText: "0701 234 5678",
                  hintTextColor: FYColors.subtleBlack,
                  prefixIcon: SizedBox(
                    width: 85,
                    child: LocalTheme(
                      buttonTextStyle: context.theme.textTheme.bodyText1,
                      bodyStyle2: context.theme.textTheme.bodyText2,
                      child: FYCountryCodePicker(
                          selectedCountryCode: CountryCode(
                        flagUri: Images.chef_place_holder,
                        name: "Nigeria",
                        code: "NG",
                        dialCode: "+234",
                      )),
                      //     SizedBox(
                    ),
                  ),
                ),
              ),
              SizedBox(height: sh(40)),
              Text(
                "Event Details",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w700,
                    color: FYColors.darkerBlack2),
              ),
              SizedBox(height: sh(16)),
              Text(
                "Type of Event",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: Dimens.k16,
                    fontWeight: FontWeight.w400,
                    color: FYColors.darkerBlack2),
              ),
              SizedBox(height: sh(16)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext buildContext, int index) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Radio(
                    value: null,
                    onChanged: null,
                    groupValue: null,
                  ),
                  title: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w400,
                            color: FYColors.darkerBlack2),
                        text: "Corporate Events",
                      ),
                      TextSpan(
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            color: FYColors.lighterBlack2),
                        text: "(e.g. Board Meetings,Company Retreat, etc)",
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: sh(32)),
              InputFieldWrapper(
                labelText: "Date of Event",
                child: SecondaryTextField(
                  hintText: "25 / 07 / 1990",
                  hintTextColor: FYColors.subtleBlack,
                  suffixIcon: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: sw(4.0), vertical: sh(4.0)),
                    margin: EdgeInsets.only(right: sw(8)),
                    child: SvgPicture.asset(Images.calender),
                  ),
                ),
              ),
              SizedBox(height: sh(8)),
              InputFieldWrapper(
                labelText: "Time",
                child: SecondaryTextField(
                  hintText: "00 : 00",
                  hintTextColor: FYColors.subtleBlack,
                  suffixIcon: Container(
                      width: sw(80),
                      child: FYDropDownButton(
                          hintText: "PM",
                          options: [],
                          onChanged: (FYOptionItem value) {},
                          errorMessage: "")),
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Event Location",
                child: SecondaryTextField(
                  hintText: "Airport Road, Abuja",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Type of Food Required",
                child: SecondaryTextField(
                  hintText: "Your answer",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Quantity of Food(Estimated Guest Count)",
                child: SecondaryTextField(
                  hintText: "500",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Any other important detail?",
                child: SecondaryTextField(
                  hintText: "Your answer",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(24)),
              FYTextButton(
                text: "Place Request",
                onPressed: () {},
              ),
              SizedBox(height: sh(58)),
            ],
          ),
        ),
      ),
    );
  }
}
