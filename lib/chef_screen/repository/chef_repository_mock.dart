import 'package:food_yours_customer/chef_screen/repository/chef_repository.dart';

class ChefRepositoryMock implements ChefRepository {
  @override
  loadChef(Map<String, dynamic> requestInformation) {}

  @override
  loadMealsByChef(Map<String, dynamic> requestInformation) {}

  @override
  loadChefReviews(Map<String, dynamic> requestInformation) {}

  @override
  rateChef(Map<String, dynamic> requestInformation) {}
}
