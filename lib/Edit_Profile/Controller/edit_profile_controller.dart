import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Edit_Profile/Model/edit_profile_model.dart';
import 'package:communiversity/Services/connectivity_manager.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

final box = GetStorage();
dynamic user_id_response;
File? image;
var token = box.read("token");

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  late TextEditingController userNameController, userEmailController, programController, addressController, bioController;

  var selestedImagePath = ''.obs;
  var selestedImageSize = ''.obs;
  var isprofilepicpathset = false.obs;

  var userName = "";
  var userEmail = "";
  var program = "".obs;
  var address = "";
  var bio = "";

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController(text: box.read("user_name"));
    userEmailController = TextEditingController(text: box.read("user_email"));
    programController = TextEditingController(text: box.read("program"));
    addressController = TextEditingController(text: box.read("address"));
    bioController = TextEditingController(text: box.read("bio"));
  }

  @override
  void onReady() {
    super.onReady();
  }

 var profilepicpath = "".obs;
  
  ImagePicker imagePicker = ImagePicker();
  File? pickedFile;

  void takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    print("imagepath${pickedFile}");
    setprofilepath(pickedFile!.path);
    Get.back();
  }
  void setprofilepath(String path) {
    selestedImagePath.value = path;
    isprofilepicpathset.value = true;
  }

  Future<void> uploadImage() async {
    final isValid = editProfileFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editProfileFormKey.currentState!.save();

    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      var token = box.read('token');
      Map<String, String> header = {"Authorization": 'Bearer $token'};
      var uri = Uri.parse(NetworkStrings.apiBaseUrl + 'updateProfile');
      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(header);
      request.fields['user_name'] = userName;
      request.fields['user_email'] = userEmail;
      request.fields['program'] = program.value;
      request.fields['address'] = address;
      request.fields['bio'] = bio;
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

        var obj = EditProfileModel.fromJson(jsonData);

        box.remove("profilePicture");
        String pic = NetworkStrings.imageBaseUrl + obj.user!.profilePicture!;
        box.write("profilePicture", obj.user!.profilePicture);
        print(box.read("profilePicture"));
        box.write("user_name", obj.user!.userName);
        print(box.read("user_name"));
        box.write("user_email", obj.user!.userEmail);
        print(box.read("user_email"));
        box.write("program", obj.user!.program);
        print(box.read("program"));
        box.write("address", obj.user!.address);
        print(box.read("address"));
        box.write("bio", obj.user!.bio);
        print(box.read("bio"));

        CustomSnackBar(jsonData['message']);
        Get.toNamed(Routes.ZOOM_DRAWER_SCREEN);
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
}
