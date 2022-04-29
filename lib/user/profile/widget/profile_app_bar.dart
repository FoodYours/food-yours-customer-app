import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      padding: EdgeInsets.symmetric(horizontal: sw(25)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // RoundImage(height: sh(40), width: sw(40)),
        SizedBox(width: sw(12)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.value.firstName} ${user.value.lastName}",
              style: context.theme.textTheme.headline2!
                  .copyWith(fontSize: sh(Dimens.k16)),
            ),
            Text(user.value.email,
                style: context.theme.textTheme.caption!
                    .copyWith(fontSize: sh(12))),
          ],
        ),
        Expanded(child: Container()),
        Text(
          "-logout",
          style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12)),
        ),
      ]),
    );
  }
}
