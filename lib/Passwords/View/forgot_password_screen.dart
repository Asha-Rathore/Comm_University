import 'dart:async';

import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/bottom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Passwords/Controller/forgot_password_controller.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: headerImageWidget(AssetPaths.FORGOT_HEAD_IMAGE, AppStrings.FORGOT_PASSWORD_HEADING_TEXT),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: forgotPasswordController.forgotPasswordFormKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              appTextField(
                AppStrings.EMAIL_TEXT, 
                false, 
                AssetPaths.EMAIL_ICON,
                forgotPasswordController.emailController,
                  (value){
                    forgotPasswordController.email = value!;
                  }
              ),
              SizedBox(
                height: 35.h,
              ),
              appButton(AppStrings.SEND_CODE_TEXT),
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
      onTap: (){
        forgotPasswordController.checkValidEmail();
      }
    );
  }
}
