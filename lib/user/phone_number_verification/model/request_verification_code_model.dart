import 'package:food_yours_customer/common/model/model.dart';

class RequestVerificationCodeModel extends Model {
  final String phoneNumber;
  final String idToken;

  RequestVerificationCodeModel({
    this.phoneNumber = "",
    this.idToken = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": idToken,
      "sKey": sKey,
      "clientPhone": phoneNumber,
    };
  }
}
