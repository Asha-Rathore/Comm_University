import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Passwords/Models/change_password_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
class ChangeOlderPasswordController extends GetxController{

  final GlobalKey<FormState> changeOlderPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController, newPasswordController;

  var password = "";
  var newpassword = "";

  @override
  void onInit(){
    super.onInit();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  void changePassword()
  async {
    final isValid = changeOlderPasswordFormKey.currentState!.validate();

    if(!isValid){
      return;
    }
    
    changeOlderPasswordFormKey.currentState!.save();

    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = box.read('id');
    data['old_password'] = password;
    data['new_password'] = newpassword;
    var response = await ApiService.put(NetworkStrings.changeOlderPasswordEndpoint, data, true).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);

    if (response.statusCode == 200) {
      Get.toNamed(Routes.ZOOM_DRAWER_SCREEN);
      print(jsonData['message']);

      var obj = ChangeOlderPasswordModel.fromJson(jsonData);
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