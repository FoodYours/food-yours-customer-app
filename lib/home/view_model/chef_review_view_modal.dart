import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChefReviewViewModel {
  String id;
  String userRemark;
  String userRating;
  String userDate;
  String userName;
  String userImage;
  String chefPostedTo;

  ChefReviewViewModel({
    this.id = "",
    this.userRemark = "",
    this.userRating = "",
    this.userDate = "",
    this.userName = "",
    this.userImage = "https://foodyours.com/views/assets/img/bg.png",
    this.chefPostedTo = "",
  });

  ChefReviewViewModel.fromJson(Map<String, dynamic>? json)
      : id = json?['id'] ?? "",
        userRemark = json?['userRemark'] ?? "",
        userRating = json?['userRating'] ?? "",
        userDate = json?['userDate'] ?? DateTime.now().toString(),
        userName = json?['userName'] ?? "",
        userImage = json?['userImage'] ?? "",
        chefPostedTo = json?['chefPostedTo'] ?? "";

  static getList(List? json) {
    List<Map<String, dynamic>> chefReviews =
        List<Map<String, dynamic>>.from(json ?? []);
    return List.generate(chefReviews.length,
        (index) => ChefReviewViewModel.fromJson(chefReviews[index])).obs;
  }

  @override
  String toString() {
    return 'ChefReviewViewModel{id: $id, userRemark: $userRemark, userRating: $userRating, userDate: $userDate, userName: $userName, userImage: $userImage, chefPostedTo: $chefPostedTo}';
  }
}
