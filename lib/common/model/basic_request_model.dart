import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/model/model.dart';

class BasicRequestModel extends Model {
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": token,
      "sKey": sKey,
    };
  }
}
