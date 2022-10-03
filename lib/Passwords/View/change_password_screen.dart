import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Passwords/Controller/change_password_controller.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangeOlderPasswordController changeOlderPasswordController = Get.put(ChangeOlderPasswordController());
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.CHANGE_PASSWORD_TEXT),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Form(
          key: changeOlderPasswordController.changeOlderPasswordFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                appTextField(
                  AppStrings.CURRENT_PASSWORD_TEXT, 
                  true, 
                  AssetPaths.PASSWORD_ICON,
                  changeOlderPasswordController.passwordController,
                    (value){
                      changeOlderPasswordController.password = value!;
                    }
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                appTextField(
                  AppStrings.NEW_PASSWORD_TEXT, 
                  true, 
                  AssetPaths.PASSWORD_ICON,
                  changeOlderPasswordController.newPasswordController,
                    (value){
                      changeOlderPasswordController.newpassword = value!;
                    }
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                appTextField(
                  AppStrings.CONFIRM_NEW_PASSWORD_TEXT, 
                  true, 
                  AssetPaths.PASSWORD_ICON,
                  changeOlderPasswordController.passwordController,
                    (value){
                      changeOlderPasswordController.password = value!;
                    }
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
                appButton(AppStrings.SAVE_CHANGES_TEXT),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
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
        changeOlderPasswordController.changePassword();
      },
    );
  }
}
