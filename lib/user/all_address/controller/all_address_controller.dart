import 'package:food_yours_customer/cart/view_model/address_view_model.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class AllAddressesController extends GetxController {
  Rx<AddressViewModel> addressViewModel = AddressViewModel().obs;

  RxString addressType = "".obs;

  @override
  void onReady() {
    setGetxArgument();
    super.onReady();
  }

  void setGetxArgument() {
    addressViewModel.value = Get.arguments["addresses"];
  }

  onAddressSelected(String? type, String address) {
    addressType.value = type!;
    Get.back(result: address);
  }
}
