import 'dart:async';

import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/bottom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/Auth_Module/Controller/login_controller.dart';
import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header:
          headerImageWidget(AssetPaths.LOGIN_HEAD_IMAGE, AppStrings.LOGIN_TEXT),
      child: SingleChildScrollView(
        child: Form(
          key: loginController.loginFormKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              appTextField(
                AppStrings.EMAIL_TEXT, 
                false, 
                AssetPaths.EMAIL_ICON,
                loginController.emailController,
                (value){
                  loginController.email = value!;
                }
              ),
              SizedBox(
                height: 10.h,
              ),
              appTextField(
                AppStrings.PASSWORD_TEXT, 
                true, 
                AssetPaths.PASSWORD_ICON,
                loginController.passwordController,
                (value){
                  loginController.password = value!;
                }
              ),
              SizedBox(
                height: 35.h,
              ),
              customText(),
              SizedBox(
                height: 35.h,
              ),
              appButton(AppStrings.LOGIN_CAPITAL_TEXT),
              SizedBox(
                height: 35.h,
              ),
              bottomText(
                  AppStrings.DONT_HAVE_AN_ACC_TEXT, AppStrings.SIGNUP_CAPITAL_TEXT),
              SizedBox(
                height: 10.h,
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

  Widget customText() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.FORGOT_PASSWORD_SCREEN);
      },
      child: const Text(
        AppStrings.FORGOT_PASSWORD_TEXT,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.BLACK_COLOR,
        ),
      ),
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        loginController.login();
      },
    );
  }

  Widget bottomText(String firstText, String secondText) {
    return BottomText(
      firstText: firstText,
      secondText: secondText,
      onTap: () {
        Get.toNamed(Routes.SIGNUP_SCREEN);
      },
    );
  }
}
