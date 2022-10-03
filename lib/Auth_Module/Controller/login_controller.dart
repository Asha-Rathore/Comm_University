import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Auth_Module/Models/login_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Utils/Routes/app_pages.dart';

final box = GetStorage();

class LoginController extends GetxController {

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController
      emailController,
      passwordController;

  var email = "";
  var password = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> login() async {
      // String? FMtoken = await FirebaseMessaging.instance.getToken();
      // print("llllllllllllll");
      // print(FMtoken);
      loginFormKey.currentState!.save();
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_email'] = email;
      data['user_password'] = password;
      data['user_device_token'] = "123";
      var response =
          await ApiService.post(NetworkStrings.loginEndpoint, data, false);
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        print(jsonData['message']);
        var obj = LoginModel.fromJson(jsonData);
        Get.toNamed(Routes.ZOOM_DRAWER_SCREEN);
        box.write("token", obj.token);
        box.write("id", obj.data!.id);
        box.write("profilePicture", obj.data!.profilePicture);
        box.write("user_name", obj.data!.userName);
        box.write("user_email", obj.data!.userEmail);
        box.write("program", obj.data!.program);
        box.write("address", obj.data!.address);
        box.write("bio", obj.data!.bio);
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
  }
}
