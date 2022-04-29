import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/shimmer_widget.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_item.dart';

class FoodCategoryList extends StatelessWidget {
  final bool isLoading;
  final Function(int, FoodCategoryViewModel)? onCategorySelected;
  final int selectedCategoryIndex;
  final List<FoodCategoryViewModel> foodCategories;
  final int itemCount;

  const FoodCategoryList({
    Key? key,
    this.isLoading = false,
    this.onCategorySelected,
    required this.foodCategories,
    required this.selectedCategoryIndex,
    this.itemCount = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (_, index) => isLoading
          ? ShimmerWidget()
          : FoodCategoryItem(
              foodCategories[index],
              onSelected: onCategorySelected,
              isSelected: index == selectedCategoryIndex,
              index: index,
            ),
      itemCount: itemCount,
    );
  }
}
