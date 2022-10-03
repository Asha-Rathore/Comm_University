import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Bottom_Navigation/Models/get_current_events_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class GetCurrentEventsController extends GetxController {
  RxList<Events> currentEventList = <Events>[].obs;

  @override
  void onInit() {
    getAllEvents();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getAllEvents() async {
    var response =
        await ApiService.get(NetworkStrings.getCurrentEventsEndPoint, true)
            .timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      print(jsonData['message']);
      var obj = EventModel.fromJson(jsonData);
      // print(obj);
      currentEventList.value = obj.events!;
      stopLoading();

      //SnackBar("Logout Status", jsonData['message']);
    } else if (response.statusCode == 401) {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    } else {
      stopLoading();
      //SnackBar("Logout Status", jsonData['message']);
      print(jsonData['message']);
    }
  }
}
