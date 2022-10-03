

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Auth_Module/Models/signup_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Services/connectivity_manager.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

final box = GetStorage();
dynamic user_id_response;

class SignUpController extends GetxController {

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController userNameController,
      emailController,
      chooseProgramController,
      addressController,
      passwordController,
      confirmPasswordController,
      bioController;

  var userName = "";
  var email = "";
  var chooseProgram = "".obs;
  var address = "";
  var password = "";
  var confirmPassword = "";
  var bio = "";

  var selestedImagePath = ''.obs;
  var selestedImageSize = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    chooseProgramController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    bioController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    chooseProgramController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    bioController.dispose();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selestedImagePath.value = pickedFile.path;
      selestedImageSize.value =
          ((File(selestedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb"; 
    } else {
      CustomSnackBar("No image selected");
    }
  }

  Future<void> uploadImage() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState!.save();

    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      String? FMtoken = await FirebaseMessaging.instance.getToken();
      print(FMtoken);
      var token = box.read('token');
      Map<String, String> header = {"Authorization": 'Bearer $token'};
      var uri = Uri.parse(NetworkStrings.apiBaseUrl + NetworkStrings.signupEndpoint);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(header);
      request.fields['user_name'] = userName;
      request.fields['user_email'] = email;
      request.fields['user_password'] = password;
      request.fields['program'] = chooseProgram.value;
      request.fields['address'] = address;
      request.fields['bio'] = bio;
      request.fields['user_device_token'] = FMtoken!;
      var multipart =
          http.MultipartFile.fromPath('profilePicture', selestedImagePath.value);
      request.files.add(await multipart);
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        print(token);
        stopLoading();

        var obj = SignUpModel.fromJson(jsonData);

        CustomSnackBar(jsonData['message']);
        Get.toNamed(Routes.OTP_VERIFICATION_SCREEN, arguments: [true, user_id_response]);
        selestedImagePath.value = '';
      } else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      }else {
        print(response.statusCode);
        print(response.body);
        stopLoading();
        CustomSnackBar(jsonData['message']);
      }
    } else {
      stopLoading();
      CustomSnackBar("NO_INTERNET_CONNECTION");
      return;
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
    
  }

  // Future<void> checkSignUp() async {

  //   // try {
  //     String? FMtoken = await FirebaseMessaging.instance.getToken();
  //     print(FMtoken);
  //     signupFormKey.currentState!.save();
  //     final Map<String, dynamic> data = <String, dynamic>{};
  //     data['user_name'] = userName;
  //     data['user_email'] = email;
  //     data['user_password'] = password;
  //     data['program'] = chooseProgram;
  //     data['address'] = address;
  //     data['bio'] = bio;
  //     data['profilePicture'] = "/C:/Users/sheheryar.waseem/Downloads/1498199 (2).jpg";
  //     data['user_device_token'] = FMtoken;

  //     var response =
  //         await ApiService.post(NetworkStrings.signupEndpoint, data, false);
  //             // .timeout(Duration(seconds: 120));
  //     var jsonData = jsonDecode(response!.body);

  //     if (response.statusCode == 200) {
  //       print(jsonData['message']);
  //       var obj = SignUpModel.fromJson(jsonData);
  //       user_id_response = obj.data!.userId;
  //       Get.toNamed(Routes.OTP_VERIFICATION_SCREEN,arguments: [true, user_id_response]);
  //       print(obj.data!.userId);

  //       CustomSnackBar(jsonData['message']);

  //       Fluttertoast.showToast(
  //         msg: "OTP: 12345",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 10,
  //         backgroundColor: AppColors.BLACK_COLOR,
  //         textColor: AppColors.WHITE_COLOR,
  //       );
  //     } else if (response.statusCode == 401) {
  //       Get.offAllNamed(Routes.LOGIN_SCREEN);
  //     } else {
  //       stopLoading();
  //       CustomSnackBar(jsonData['message']);
  //       print(jsonData['message']);
  //     }
  //     print(response.statusCode);
  //     print(response.body);
  //   // } on TimeoutException catch (_) {
  //   //   stopLoading();
  //   //   CustomSnackBar("Server not responding");
  //   // }
  // }
}
