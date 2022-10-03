import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Messages/Widgets/message_container.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.NOTIFICATIONS_TEXT),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index){
          return Column(
            children: [
              Text(
                AppStrings.TODAY_TEXT,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.GREY_COLOR,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  // return Text("data");
                  return Column(
                    children: [
                      MessageContainer(),
                      Divider(
                        color: AppColors.GREY_COLOR,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      )
                    ],
                  );
                }
              ),
            ],
          );
        }
      ),
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }
}
