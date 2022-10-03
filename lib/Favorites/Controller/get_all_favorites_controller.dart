import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Favorites/Model/get_all_favorite_events_model.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class GetFavEventsController extends GetxController {
  RxList<Favourites> favoriteEventList = <Favourites>[].obs;

  @override
  void onInit() {
    getAllFavourites();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getAllFavourites() async {
    var response =
        await ApiService.get(NetworkStrings.getFavouriteEventsEndPoint, true)
            .timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      print(jsonData['message']);
      var obj = GetFavouriteEventsModel.fromJson(jsonData);
      // print(obj);
      favoriteEventList.value = obj.favourites!;
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
