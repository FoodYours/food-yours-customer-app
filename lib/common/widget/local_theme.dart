import 'package:flutter/material.dart';

class LocalTheme extends StatelessWidget {
  final Widget child;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final Color? backGroundColor;
  final Color? primaryColor;
  final TextStyle? bodyStyle2;
  final ButtonStyle? outlineButtonStyle;

  LocalTheme({
    required this.child,
    this.buttonStyle,
    this.buttonTextStyle,
    this.backGroundColor,
    this.primaryColor,
    this.bodyStyle2,
    this.outlineButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
          primaryColor: primaryColor,
          backgroundColor: backGroundColor,
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          outlinedButtonTheme:
              OutlinedButtonThemeData(style: outlineButtonStyle),
          textTheme: TextTheme(
            button: buttonTextStyle,
            bodyText2: bodyStyle2,
          )),
      child: child,
    );
  }
}
