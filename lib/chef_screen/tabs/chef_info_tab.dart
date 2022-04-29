import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/common/widget/text/inter_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/instance_manager.dart';

class ChefInfoTab extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k16),
            vertical: sh(Dimens.k32),
          ),
          child: Inter400Text(
            text:
                "Facilisis leo at pretium elementum et feugiat odio rhoncus suscipit. Nullam risus feugiat purus dolor ultricies id ante purus orci. Malesuada quis malesuada urna dolor blandit facilisi aliquet laoreet. Duis semper sed amet",
            fontSize: sh(Dimens.k16),
            color: FYColors.darkerBlack,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k150),
        ),
      ],
    );
  }
}
