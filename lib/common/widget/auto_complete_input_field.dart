import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_yours_customer/common/view_model/selectable.dart';
import 'package:food_yours_customer/common/widget/shimmer_widget.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AutoCompleteInputField<T extends Selectable> extends StatelessWidget {
  final void Function(T) onSelected;
  final FutureOr<Iterable<T>> Function(String seachQuery) suggestionsCallback;
  final String hintText;
  final TextEditingController searchQueryTextController;
  AutoCompleteInputField({
    required this.onSelected,
    required this.suggestionsCallback,
    required this.searchQueryTextController,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return TypeAheadField<T>(
      debounceDuration: Duration(milliseconds: 500),
      textFieldConfiguration: TextFieldConfiguration(
        controller: searchQueryTextController,
        style: context.theme.textTheme.headline2!
            .copyWith(fontSize: Dimens.k16, color: FYColors.darkerBlack2),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: context.theme.textTheme.headline2!.copyWith(
            color: FYColors.lighterBlack2,
            fontSize: sh(Dimens.k16),
          ),
          counterText: "",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: FYColors.subtleBlack4, width: Dimens.k05)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: FYColors.lighterRed, width: Dimens.k05)),
          hintText: hintText,
          prefixIcon: Icon(FYIcons.search),
        ),
      ),
      errorBuilder: (BuildContext context, error) {
        return SizedBox(height: 0, width: 0);
      },
      suggestionsCallback: suggestionsCallback,
      itemBuilder: (context, T suggestion) {
        return ListTile(
          leading:
              Icon(FYIcons.search, size: 24, color: FYColors.lighterBlack3),
          title: SubstringHighlight(
            text: suggestion.name.toString(),
            term: searchQueryTextController.text,
            textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
          ),
        );
      },
      loadingBuilder: (BuildContext context) {
        return ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => ShimmerWidget(
            height: sh(60),
          ),
          separatorBuilder: (context, index) => SizedBox(height: sh(10)),
          itemCount: 20,
        );
      },
      noItemsFoundBuilder: (context) => Container(),
      onSuggestionSelected: onSelected,
    );
  }
}
