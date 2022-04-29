import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/model/model.dart';

class ChefReviewModel extends Model {
  final String vendorId;
  final String starRated;
  final String remark;

  ChefReviewModel(
      {required this.vendorId, required this.starRated, required this.remark});

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "vendorID": vendorId,
      "sKey": sKey,
      "starRated": starRated,
      "Remark": remark,
      "idToken": token,
    };
  }
}
