import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYDropDownButton<T> extends StatelessWidget {
  final List<FYOptionItem<T>> options; //

  final Function(FYOptionItem<T>) onChanged; //

  final String hintText; //

  final FYOptionItem<T>? selectedOption;

  final String errorMessage;

  final FocusNode? focusNode;

  final bool isExpanded;

  final Color borderColor;

  final bool hideIcon;

  FYDropDownButton({
    required this.options,
    required this.onChanged,
    required this.hintText,
    required this.errorMessage,
    this.focusNode,
    this.selectedOption,
    this.isExpanded = false,
    this.borderColor = Colors.transparent,
    this.hideIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: sh(56.99),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              border: Border.all(
                  color: errorMessage.isEmpty
                      ? borderColor
                      : FYColors.lighterOrange,
                  style: BorderStyle.solid,
                  width: 0.3)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              focusColor: FYColors.lighterRed,
              child: DropdownButton<FYOptionItem<T>>(
                icon: hideIcon ? Icon(Icons.arrow_drop_down) : SizedBox(),
                isExpanded: isExpanded,
                dropdownColor: Colors.white,
                focusNode: focusNode,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: sh(13), fontWeight: FontWeight.w400),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                hint: Text(
                  hintText,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: sh(16)),
                ),
                value: selectedOption,
                items: _getDropdownItems(context, options, sh, sw),
                onChanged: (FYOptionItem<T>? value) => onChanged(value!),
              ),
            ),
          ),
        ),
        SizedBox(
          height: (1),
        ),
        errorMessage.isEmpty
            ? Container()
            : Text(errorMessage,
                style:
                    TextStyle(fontSize: sh(12), color: FYColors.lighterOrange))
      ],
    );
  }

  List<DropdownMenuItem<FYOptionItem<T>>>? _getDropdownItems(
      BuildContext context,
      List<FYOptionItem<T>> items,
      Function sh,
      Function sw) {
    // ignore: unnecessary_null_comparison
    if (items == null || items.length < 1) {
      return null;
    } else {
      return items
          .map((item) => DropdownMenuItem(
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: sh(13)),
                ),
                value: item,
              ))
          .toList();
    }
  }
}
