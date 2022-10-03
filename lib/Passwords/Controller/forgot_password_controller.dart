import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Passwords/Models/forgot_password_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

dynamic user_id_response;

class ForgotPasswordController extends GetxController{

  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = "";

  @override
  void onInit(){
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    emailController.dispose();
  }

  void checkValidEmail() async
  {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    forgotPasswordFormKey.currentState!.save();

    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['user_email'] = email;
    var response = await ApiService.post(NetworkStrings.forgotPasswordEndpoint, data, false).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) 
    {
      print(jsonData['message']);
      var obj = ForgotPasswordModel.fromJson(jsonData);
      user_id_response = obj.data!.userId;
      Get.toNamed(Routes.OTP_VERIFICATION_SCREEN, arguments: [false, user_id_response]);
      CustomSnackBar(jsonData['message']);

      Fluttertoast.showToast(
        msg: "OTP: 12345",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: AppColors.BLACK_COLOR,
        textColor: AppColors.WHITE_COLOR,
      );
    } 
    else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      }
    else {
      stopLoading();
      CustomSnackBar(jsonData['message']);
      print(jsonData['message']);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
  }
}