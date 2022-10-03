import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Passwords/Models/otp_verify_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//final box = GetStorage();

class OtpController extends GetxController {
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  late TextEditingController pinController;

  var code = "";

  var count = 30;
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    StartTime();
    pinController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pinController.dispose();
  }

  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  void reset() {
    _timer.cancel();
    count = 10;
    update();
    StartTime();
    resendCode();
  }

  Future<void> checkOtp() async {
    final isValid = otpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    otpFormKey.currentState!.save();

    dynamic args_response = Get.arguments;

    print("========================");
    print(args_response);
    print("========================");

    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_id'] = args_response[1];
      data['verification_code'] = code;

      var response =
          await ApiService.post(NetworkStrings.otpEndpoint, data, false)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        if (args_response[0] == false) {
          Get.offAllNamed(Routes.RESET_PASSWORD_SCREEN, arguments: args_response[1]);
        } else {
          Get.offAllNamed(Routes.LOGIN_SCREEN);
        }

        print(jsonData['message']);
        var obj = OtpVerificationModel.fromJson(jsonData);
        CustomSnackBar(jsonData['message']);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      } else {
        stopLoading();
        CustomSnackBar(jsonData['message']);
        print(jsonData['message']);
      }
      print(response.statusCode);
      print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
  }

  Future<void> resendCode() async {
    try {
        dynamic args_response = Get.arguments;

        print("========================");
        print(args_response);
        print("========================");

        final Map<String, dynamic> data = <String, dynamic>{};
        data['user_id'] = args_response[1];

        var response = await ApiService.post(
                NetworkStrings.resendCodeEndpoint, data, false)
            .timeout(Duration(seconds: 120));
        var jsonData = jsonDecode(response!.body);

        if (response.statusCode == 200) {
          print(jsonData['message']);
          var obj = OtpVerificationModel.fromJson(jsonData);
          CustomSnackBar(jsonData['message']);
          Fluttertoast.showToast(
          msg: "OTP: 12345",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: AppColors.BLACK_COLOR,
          textColor: AppColors.WHITE_COLOR,
        );
          stopLoading();
        } else if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN_SCREEN);
        } else {
          CustomSnackBar(jsonData['message']);
          print(jsonData['message']);
        }
        print(response.statusCode);
        print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
  }
}
