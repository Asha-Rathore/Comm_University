import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Passwords/Models/reset_password_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController;

  var password = "";

  @override
  void onInit(){
    super.onInit();
    passwordController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    passwordController.dispose();
  }

  Future<void> checkPassword()
  async {
    final isValid = changePasswordFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    
    changePasswordFormKey.currentState!.save();

    try{
      dynamic args_response = Get.arguments;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args_response;
    data['new_password'] = password;
    var response = await ApiService.post(NetworkStrings.changePasswordEndpoint, data, false).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
      print(jsonData['message']);
      var obj = ChangePasswordModel.fromJson(jsonData);
      CustomSnackBar(jsonData['message']);
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