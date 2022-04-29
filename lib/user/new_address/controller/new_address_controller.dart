import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/cart/service/cart_service/cart_service.dart';
import 'package:food_yours_customer/common/model/model.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
// import 'package:get/state_manager.dart';

class NewAddressController extends GetxController {
  CartService cartService = Get.find();

  RxBool isLoading = false.obs;

  RxString loadingMessage = "".obs;

  final TextEditingController streetTextCtrl = TextEditingController();
  final TextEditingController stateTextCtrl = TextEditingController();

  List<FYOptionItem> addressTypes = [
    FYOptionItem("Home", Strings.mainAddress),
    FYOptionItem("Work", Strings.otherAddress),
    FYOptionItem("Gym", Strings.workAddress),
  ];

  late Rx<FYOptionItem> selectedAddressType = addressTypes[0].obs;

  late RxString addressTypeError = "".obs;

  addNewAddress() async {
    isLoading.value = true;

    loadingMessage.value = "Save Delivery Addresses";

    AddressModel addressModel = setAddressModel();

    AppResponse response =
        await cartService.addNewAddress(addressModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    Get.back();
  }

  AddressModel setAddressModel() {
    return AddressModel(
      mainAddress: selectedAddressType.value == Strings.mainAddress
          ? "${streetTextCtrl.text}, ${stateTextCtrl.text}"
          : "",
      otherAddress: selectedAddressType.value == Strings.otherAddress
          ? "${streetTextCtrl.text}, ${stateTextCtrl.text}"
          : "",
      workAddress: selectedAddressType.value == Strings.workAddress
          ? "${streetTextCtrl.text}, ${stateTextCtrl.text}"
          : "",
    );
  }

  onAddressTypeSelected(FYOptionItem value) {
    selectedAddressType.value = value;
  }
}

class AddressModel extends Model {
  final String mainAddress;
  final String workAddress;
  final String otherAddress;

  AddressModel({
    this.mainAddress = "",
    this.workAddress = "",
    this.otherAddress = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": token,
      "sKey": sKey,
      "mainAddress": mainAddress,
      "workAddress": workAddress,
      "otherAddress": otherAddress,
    };
  }
}
