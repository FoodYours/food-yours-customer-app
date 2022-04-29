import 'package:food_yours_customer/auth/repository/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  signUp(Map<String, dynamic> registrationInformation) async {
    await Future.delayed(Duration(seconds: 5));
    return {
      "code": 200,
      "message": "Success creating account.",
      "timestamp": null,
    };
  }

  @override
  login(Map<String, dynamic> loginInformation) {}

  @override
  initiatePasswordReset(Map<String, dynamic> passwordResetInformation) {}
}
