import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(24.0)),
      height: Dimens.k405,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Card(
          elevation: 8,
          shadowColor: Color.fromRGBO(0, 99, 247, 0.2),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
