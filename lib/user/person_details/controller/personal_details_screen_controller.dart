import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/date_picker.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/user/person_details/model/profile_update_model.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/phone_util.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class PersonalDetailsScreenController extends GetxController {
  UserService userService = Get.find();

  Rx<CountryCode> selectedCountryCode = CountryCode(
    flagUri: Images.chef_place_holder,
    name: "Nigeria",
    code: "NG",
    dialCode: "+234",
  ).obs;

  final TextEditingController firstNameTextCtrl = TextEditingController();
  final TextEditingController lastNameTextCtrl = TextEditingController();
  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController phoneTextCtrl = TextEditingController();
  final TextEditingController dobTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();
  final Rx<FYOptionItem<String>> selectedGender =
      FYOptionItem<String>("Male", "male").obs;

  RxString firstNameError = "".obs;
  RxString lastNameError = "".obs;
  RxString emailError = "".obs;
  RxString phoneError = "".obs;
  RxString dobError = "".obs;
  RxString genderError = "".obs;

  RxString loadingMessage = "".obs;

  final RxBool isProfileEdited = false.obs;

  RxBool isLoading = false.obs;

  final List<FYOptionItem<String>> genders = [
    FYOptionItem("Male", "male"),
    FYOptionItem("Female", "female"),
  ];

  void clearFirstNameError(_) => firstNameError.value = "";
  void clearLastNameError(_) => lastNameError.value = "";
  void clearEmailError(_) => emailError.value = "";
  void clearPhoneError(_) => phoneError.value = "";
  void clearDobError(_) => dobError.value = "";
  void clearGenderError() => genderError.value = "";

  @override
  void onReady() {
    prePopulateUserInputFields();
    super.onReady();
  }

  void prePopulateUserInputFields() {
    firstNameTextCtrl.text = user.value.firstName;
    lastNameTextCtrl.text = user.value.lastName;
    emailTextCtrl.text = user.value.email;
    phoneTextCtrl.text = user.value.phone;
  }

  validateInput() async {
    if (GetUtils.isBlank(firstNameTextCtrl.text)!) {
      firstNameError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(lastNameTextCtrl.text)!) {
      lastNameError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(emailTextCtrl.text)! &&
        GetUtils.isEmail(emailTextCtrl.text)) {
      lastNameError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(phoneTextCtrl.text)! &&
        await isPhoneNumberValid(
                phoneTextCtrl.text, selectedCountryCode.value.code!) ==
            false) {
      phoneError.value = Strings.validPhoneNumberErrorMessage;
    } else if (GetUtils.isBlank(dobTextCtrl.text)!) {
      dobError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(selectedGender.value.name)!) {
      genderError.value = Strings.blankFieldErrorMessage;
    } else {
      saveProfileDetails();
    }
  }

  setDateOfBirth() async {
    final DateTime? picked = await showAppDatePicker();

    if (picked != null) {
      dobTextCtrl.text = picked.toString().substring(0, 11);
      dobError.value = "";
    }
  }

  onGenderSelected(FYOptionItem<String> gender) {
    selectedGender.value = gender;
    clearGenderError();
  }

  void saveProfileDetails() async {
    isLoading.value = true;

    loadingMessage.value = "Updating your profile";

    ProfileUpdateModel profileInformation = setProfileDetails();

    AppResponse response =
        await userService.saveProfileDetails(profileInformation.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    return gotoNextScreen();
  }

  void gotoNextScreen() => pop();

  ProfileUpdateModel setProfileDetails() {
    return ProfileUpdateModel(
      firstName: firstNameTextCtrl.text,
      lastName: lastNameTextCtrl.text,
      phoneNumber: phoneTextCtrl.text,
      email: emailTextCtrl.text,
      gender: selectedGender.value.value!,
      userImage: "",
    );
  }
}
