import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class SplashController{
  static checkToken(){
    if(box.read("token") != null){
      Get.offAllNamed(Routes.ZOOM_DRAWER_SCREEN);
    }
    else{
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    }
  }
}