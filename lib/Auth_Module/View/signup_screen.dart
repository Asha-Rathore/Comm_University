import 'dart:async';

import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/bottom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/Auth_Module/Controller/signup_controller.dart';
import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Auth_Module/Widgets/upload_pic_container.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());
  SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: headerImageWidget(
          AssetPaths.SIGNUP_HEAD_IMAGE, AppStrings.SIGNUP_TEXT),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: signUpController.signupFormKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              uploadPic(context),
              SizedBox(
                height: 10.h,
              ),
              appTextField(
                  AppStrings.USER_NAME_TEXT,
                  false,
                  AssetPaths.USER_ICON,
                  signUpController.userNameController, (value) {
                signUpController.userName = value!;
              }),
              SizedBox(
                height: 10.h,
              ),
              appTextField(AppStrings.EMAIL_TEXT, false, AssetPaths.EMAIL_ICON,
                  signUpController.emailController, (value) {
                signUpController.email = value!;
              }),
              SizedBox(
                height: 10.h,
              ),
              dropDown(),
              // appTextField(
              //     AppStrings.CHOOSE_PROGRAM_TEXT,
              //     false,
              //     AssetPaths.GRADUATED_ICON,
              //     signUpController.chooseProgramController, (value) {
              //   signUpController.chooseProgram = value!;
              // }),
              SizedBox(
                height: 10.h,
              ),
              appTextField(
                  AppStrings.ADDRESS_TEXT,
                  false,
                  AssetPaths.LOCATION_ICON,
                  signUpController.addressController, (value) {
                signUpController.address = value!;
              }),
              SizedBox(
                height: 10.h,
              ),
              appTextField(
                  AppStrings.PASSWORD_TEXT,
                  true,
                  AssetPaths.PASSWORD_ICON,
                  signUpController.passwordController, (value) {
                signUpController.password = value!;
              }),
              SizedBox(
                height: 10.h,
              ),
              appTextField(
                  AppStrings.CONFIRM_PASSWORD_TEXT,
                  true,
                  AssetPaths.PASSWORD_ICON,
                  signUpController.confirmPasswordController, (value) {
                signUpController.confirmPassword = value!;
              }),
              SizedBox(
                height: 10.h,
              ),
              appTextField(AppStrings.BIO_TEXT, false, AssetPaths.PASSWORD_ICON,
                  signUpController.bioController, (value) {
                signUpController.bio = value!;
              }),
              SizedBox(
                height: 35.h,
              ),
              appButton(AppStrings.SIGNUP_CAPITAL_TEXT),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              bottomText(AppStrings.ALREADY_HAVE_AN_ACC_TEXT,
                  AppStrings.LOGIN_CAPITAL_TEXT),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerImageWidget(String headerImage, String title) {
    return HeaderImage(
      headerImage: headerImage,
      title: title,
    );
  }

  Widget appTextField(
    String hintText,
    bool obsecureText,
    String prefixImage,
    TextEditingController controller,
    String? Function(String?)? onSaved,
  ) {
    return AppTextField(
      prefixImage: prefixImage,
      hinttxt: hintText,
      obscuretxt: obsecureText,
      txtController: controller,
      onSaved: onSaved,
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        signUpController.uploadImage();
      },
    );
  }

  Widget bottomText(String firstText, String secondText) {
    return BottomText(
      firstText: firstText,
      secondText: secondText,
      onTap: () {
        Get.toNamed(Routes.LOGIN_SCREEN);
      },
    );
  }

  Widget dropDown(){
    return CustomDropdownField(
      Items: AppStrings.PROGRAMS_LISTS,
      onchange: (newItem) {
        signUpController.chooseProgram.value = newItem.toString();
        
      },
    );
  }

  Widget uploadPic(BuildContext context) {
    return InkWell(
      child: UploadPicContainer(),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => bottomsheet(context),
        );
      },
    );
  }
  bottomsheet(BuildContext context) {
    return Container(
      color: AppColors.PRIMARY_COLOR,
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              print("camera");
              signUpController.getImage(ImageSource.camera);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.WHITE_COLOR,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.WHITE_COLOR,
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              print("gallery");
              signUpController.getImage(ImageSource.gallery);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(Icons.image, color: AppColors.WHITE_COLOR),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
