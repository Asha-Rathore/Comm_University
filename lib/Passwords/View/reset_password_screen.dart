import 'dart:async';

import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/bottom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Passwords/Controller/reset_password_controller.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: headerImageWidget(AssetPaths.RESET_HEAD_IMAGE, AppStrings.RESET_PASSWORD_TEXT),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: changePasswordController.changePasswordFormKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
             appTextField(
                AppStrings.NEW_PASSWORD_TEXT, 
                true, 
                AssetPaths.PASSWORD_ICON,
                changePasswordController.passwordController,
                (value){
                  changePasswordController.password = value!;
                }
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              appTextField(
                AppStrings.CONFIRM_NEW_PASSWORD_TEXT, 
                true, 
                AssetPaths.PASSWORD_ICON,
                changePasswordController.passwordController,
                (value){
                  changePasswordController.password = value!;
                }
              ),
              SizedBox(
                height: 35.h,
              ),
              appButton(AppStrings.CHANGE_PASSWORD_CAPITAL_TEXT),
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
        changePasswordController.checkPassword();
      }
    );
  }
}
