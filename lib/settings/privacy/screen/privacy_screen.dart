import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PrivacyScreen extends StatelessWidget {
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
            child: SecondaryAppBar(title: "Privacy Policy")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(44)),
            children: [
              Text(
                """Etiam aliquam diam tempor fames at mattis velit accumsan. Pellentesque at pellentesque a a nibh interdum turpis mauris. Adipiscing sapien eget pretium sollicitudin enim. Nam odio elit id neque tellus. Porta nisi diam in lacus, id feugiat. Suspendisse lorem ipsum, tristique nullam arcu imperdiet at sed. Nisl nibh pulvinar mi rhoncus, condimentum egestas viverra condimentum sem. Laoreet libero vestibulum nulla in netus. Arcu velit quam neque, volutpat velit, dictum. Diam vel et nunc nunc. Egestas faucibus in urna mauris. Nullam amet ac mi ut varius. Cursus et ut tristique posuere nulla at sit elit diam. Est eget vestibulum non elit rhoncus consectetur duis.
Turpis aliquam in quis feugiat sed volutpat odio aliquam egestas. Leo sit nibh sed mauris suspendisse. Ornare eu fermentum quisque vitae turpis suscipit laoreet dolor arcu. Amet vitae neque felis magna amet sem tortor mattis sagittis. Nulla ac cras molestie commodo. Tristique enim ultricies ultricies auctor aliquet. Enim tellus nunc, viverra eros nisi, feugiat leo magnis eget. Ultrices nisl consectetur cursus at risus. Cursus commodo quisque faucibus dapibus blandit tortor sed amet elit. Nulla nunc, suspendisse purus, ultrices urna sed eu tempor, ac. Lectus facilisi at proin quam donec.
Mauris leo quis tincidunt faucibus in. Aenean mi suscipit mus at. Mauris imperdiet urna, ac malesuada aenean mauris, ac ante. Tortor ligula diam pretium nunc quis.""",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w400,
                    color: FYColors.lighterBlack2),
              ),
            ]),
      ),
    );
  }
}
