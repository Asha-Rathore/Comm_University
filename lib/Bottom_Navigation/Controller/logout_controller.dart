import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Bottom_Navigation/Models/logout_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class LogoutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> logOut() async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_id'] = box.read("id");
      var response =
          await ApiService.post(NetworkStrings.logoutEndpoint, data, true)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      print("++++++++++++++++++++++++");
      print(box.read("_id"));
      print("-------------------------");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(box.read("token"));
        //box.remove("_id");
        box.remove("token");
        box.remove("profilePicture");
        Get.offAllNamed(Routes.LOGIN_SCREEN);
        print(jsonData['message']);
        var obj = LogoutModel.fromJson(jsonData);

        CustomSnackBar(jsonData['message']);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      } else {
        stopLoading();
        CustomSnackBar(jsonData['message']);
        print(jsonData['message']);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("Server not responding");
    }
  }
}
