import 'package:get/route_manager.dart';
import 'package:food_yours_customer/wallet_withdrawal/screen/wallet_withdrawal.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BankDetailsScreenController extends GetxController {
  gotoNextScreen() => Get.to(() => WalletWithdrawalScreen());
}
