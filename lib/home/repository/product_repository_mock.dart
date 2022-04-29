import 'package:food_yours_customer/home/repository/product_repository.dart';

class ProductRepositoryMock implements ProductRepository {
  loadFoodCategories(Map<String, dynamic> requestInformation) {}

  @override
  loadAllMealUnderSelectedCategory(Map<String, dynamic> requestInformation) {}

  @override
  loadMealSugguestions(Map<String, dynamic> requestInformation) {}

  @override
  loadMeal(Map<String, dynamic> requestInformation) {}

  @override
  getDeliveryPrice() {}

  @override
  loadChef(Map<String, dynamic> requestInformation) {}

  @override
  loadMealsByChef(Map<String, dynamic> requestInformation) {}

  @override
  loadChefReviews(Map<String, dynamic> requestInformation) {}

  @override
  addToOnlineCart(Map<String, dynamic> requestInformation) {
    // TODO: implement addToOnlineCart
    throw UnimplementedError();
  }
}
