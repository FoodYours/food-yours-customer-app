import 'package:food_yours_customer/common/view_model/view_model.dart';

class UserViewModel extends ViewModel {
  String clientId;
  String firstName;
  String lastName;
  String email;
  String phone;
  String imageUrl;
  String address;
  String accountType;

  UserViewModel({
    this.clientId = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.phone = "",
    this.imageUrl = "",
    this.address = "",
    this.accountType = "",
  });

  UserViewModel.fromJson(Map<String, dynamic>? json)
      : clientId = json?[" clientID"] ?? "",
        firstName = json?["firstName"] ?? "",
        lastName = json?["lastName"] ?? "",
        email = json?["clientEmail"] ?? "",
        phone = /* json?["clientPhone"] ?? */ "",
        imageUrl = json?["clientImage"] ?? "",
        address = json?["address"] ?? "",
        accountType = json?["accountType"] ?? "";
}
