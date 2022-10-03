import 'package:get/get.dart';

class FieldValidator {

  static RxBool isHidepassword = true.obs;
  static RxBool isHideconfirmpassword = true.obs;
  static RxBool isHideoldpassword = true.obs;
//------------- hide/Un hide--------------//

  static void oldpassword_hideIcon() {
    if (isHideoldpassword.value) {
      isHideoldpassword.value = false;
    } else {
      isHideoldpassword.value = true;
    }
  }

  static void password_hideIcon() {
    if (isHidepassword.value) {
      isHidepassword.value = false;
    } else {
      isHidepassword.value = true;
    }
  }

  static void confirm_password_hideIcon() {
    if (isHideconfirmpassword.value) {
      isHideconfirmpassword.value = false;
    } else {
      isHideconfirmpassword.value = true;
    }
  }

//------------- Name Validator--------------//
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

//------------------ Email Validator ---------------//
  static String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

//---------------- Password Validator -----------------//
  static String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

//--------------------Confirm Password Validator--------//
  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Confirm Password';
    } else if (!(password == confirmPassword)) {
      return 'Password Not Match';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Please enter valid phone number";
    }
    return null;
  }

  static String? validateOTP(String value) {
    if (value.isEmpty) {
      return "Provide valid OTP";
    }
    return null;
  }
}
