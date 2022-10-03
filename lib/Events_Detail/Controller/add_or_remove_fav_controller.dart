import 'dart:async';
import 'dart:convert';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Events_Detail/Model/add_or_remove_fav_model.dart';
import 'package:communiversity/Favorites/Controller/get_all_favorites_controller.dart';
import 'package:communiversity/Services/api_services.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get/get.dart';

dynamic user_id_response;

class AddOrRemoveFavoriteController extends GetxController{

  GetFavEventsController getAllFavoriteController = Get.put(GetFavEventsController());

  // var productId = "";

  RxBool isPressed = false.obs;

  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
  }

  void addOrRemoveFav(String eventId)async
  {
    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    var response = await ApiService.post(NetworkStrings.addOrRemoveFavoriteEndPoint, data, true).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    print("ttttttttttttttttttttt");
    if (response.statusCode == 200) 
    {
      print(jsonData['message']);
      var obj = AddOrRemoveEventsModel.fromJson(jsonData);
      if(jsonData['message'] == "Add to Favourites"){
        isPressed.value == true;
      }
      else if(jsonData['message'] == "Favourite deleted"){
        isPressed.value == false;
      }
      CustomSnackBar(jsonData['message']);
      stopLoading();
      getAllFavoriteController.favoriteEventList();
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