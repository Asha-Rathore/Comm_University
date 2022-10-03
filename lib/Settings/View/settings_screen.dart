import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.SETTINGS_TEXT),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          pushNotification(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          appButton(AppStrings.CHANGE_PASSWORD_CAPITAL_TEXT),
        ],
      ),
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }

  Widget pushNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomText(
          text: AppStrings.RECEIVE_NOTIFICATION_TEXT,
          font: FontWeight.bold,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: CupertinoSwitch(
            // activeColor: AppColors.PRIMARY_COLOR,
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
        ),
      ],
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        Get.toNamed(Routes.CHANGE_PASSWORD_SCREEN);
      },
    );
  }
}
