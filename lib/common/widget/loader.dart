import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/loading_gif.dart';
import 'package:get/utils.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loading_overlay/loading_overlay.dart';

class FYLoader extends StatelessWidget {
  final String message;
  final bool isLoading;
  final Widget child;

  FYLoader({
    this.message = "loading ...",
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: LoadingOverlay(
        child: child,
        color: context.theme.backgroundColor,
        progressIndicator: Container(
          color: context.theme.backgroundColor,
          child: LoadingGif(message: message),
        ),
        isLoading: isLoading,
      ),
    );
  }
}
