// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class PaymentMethodCard extends StatelessWidget {
  final Widget cardTitle;
  final Widget cardSubTitle;
  final bool isImage;
  final Function()? onTap;
  final bool isSelected;

  PaymentMethodCard({
    required this.cardTitle,
    required this.cardSubTitle,
    required this.isSelected,
    this.isImage = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Expanded(
      child: FYFlatButton(
        backgroundColor: FYColors.subtleBlack5,
        onPressed: onTap,
        padding: EdgeInsets.symmetric(horizontal: Dimens.k3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.k12),
          child: Card(
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          isSelected ? FYColors.mainBlue : Colors.transparent,
                      width: 0.5),
                  borderRadius: BorderRadius.circular(8)),
              padding:
                  EdgeInsets.symmetric(horizontal: sw(8), vertical: sh(4.75)),
              height: sh(74),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.check_circle,
                        size: 12,
                        color: isSelected
                            ? FYColors.mainBlue
                            : FYColors.darkerBlack4,
                      )),
                  SizedBox(height: sh(4.75)),
                  cardTitle,
                  SizedBox(
                    height: sh(isImage ? 0 : 8),
                  ),
                  cardSubTitle,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
