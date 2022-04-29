import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/model/model.dart';

class CodeVerificationModel extends Model {
  final String phoneNumber;
  final String otp;

  CodeVerificationModel({
    this.phoneNumber = "",
    this.otp = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": token,
      "sKey": sKey,
      "clientPhone": phoneNumber,
      "OTP": otp,
    };
  }
}
