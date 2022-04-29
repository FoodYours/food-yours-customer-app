import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/font_family.dart';
import 'package:food_yours_customer/resources/style.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light, // status bar brightness
    primaryColor: FYColors.mainRed,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    // buttonColor: FYColors.subtleRed2,
    textTheme: TextTheme(
      headline1: textStyleH1,
      headline2: textStyleH2,
      headline3: textStyleH3,
      headline5: textStyleH5,
      headline6: textStyleH6,
      bodyText1: bodyStyle1,
      bodyText2: bodyStyle2,
      subtitle2: subtitle2,
      subtitle1: subtitle1,
      // caption: labelText,
      // button: buttonTextStyle,
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(FYColors.mainRed)),
    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(Colors.white),
        side: BorderSide(color: FYColors.darkerBlack6),
        fillColor: MaterialStateProperty.all<Color>(FYColors.mainRed)),
    chipTheme: ChipThemeData(
      selectedColor: FYColors.mainBlue,
      disabledColor: FYColors.subtleBlack,
      secondarySelectedColor: FYColors.mainBlue,
      labelStyle: TextStyle(
          color: FYColors.mainRed,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.mulish),
      secondaryLabelStyle: TextStyle(
          color: FYColors.mainRed,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.mulish),
      brightness: Brightness.light,
      padding: EdgeInsets.all(Dimens.k8),
      backgroundColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(style: mainOutlineButtonStyle),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: hintTextStyle,
        labelStyle: labelTextStyle,
        errorStyle: errorStyle,
        errorBorder: errorBoarderStyle,
        focusedBorder: focusedBoarderStyle),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(color: Colors.transparent),
        labelColor: FYColors.mainRed,
        unselectedLabelColor: FYColors.lighterBlack3),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      buttonColor: FYColors.mainRed,
      disabledColor: FYColors.subtleBlack,
      splashColor: FYColors.darkerRed,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: FYColors.mainGreen,
      primary: FYColors.lighterBlack2,
      primaryVariant: Colors.grey,
    ),
  );
}
