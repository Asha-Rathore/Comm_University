import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Content/Model/content_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get/get.dart';


class ContentController extends GetxController {
  RxString title = ''.obs;
  RxString content = ''.obs;
  // RxList<Message> message = <Message>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

//============================================================

//===============================================

  Future<void> GetPrivacy() async {
    Get.toNamed(Routes.CONTENT_SCREEN);
    try{
      var response =
        await ApiService.get(NetworkStrings.privacyPolicyEndpont, false).timeout(Duration(seconds: 120));
    print(response!.statusCode);

    print(response.body);
    var values = jsonDecode(response.body);
    var obj = ContentModel.fromJson(values);

    if (response.statusCode == 200) {
      title.value = obj.message![0].title!;
      content.value = obj.message![0].content!;
      // message.value = obj.message!;
      print(
          "**************************");
      print(title.value);
      print(
          "**************************");
      stopLoading();
    } else if(response.statusCode == 401){
        Get.toNamed(Routes.LOGIN_SCREEN);
      }else {
      stopLoading();
      CustomSnackBar(obj.status.toString());
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
    
    // }
  }

  //===================================================
  Future<void> GetTerms() async {
    Get.toNamed(Routes.CONTENT_SCREEN);
    try{
      var response =
        await ApiService.get(NetworkStrings.termsConditionEndpont, false).timeout(Duration(seconds: 120));
    print(response!.statusCode);

    print(response.body);
    var values = jsonDecode(response.body);
    var obj = ContentModel.fromJson(values);

    if (response.statusCode == 200) {
      title.value = obj.message![0].title!;
      content.value = obj.message![0].content!;
      print(
          "**************************");
      print(title.value);
      print(
          "**************************");
          stopLoading();
    } else {
      stopLoading();
      CustomSnackBar(obj.status.toString(),);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
    
    // }
  }
}