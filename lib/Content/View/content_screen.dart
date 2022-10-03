import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Content/Controller/content_controller.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentScreen extends StatefulWidget {
  
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  ContentController contentController = Get.put(ContentController());
  @override
  // void initState() {
  //   contentController.GetPrivacy();

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> HeaderTemplate(
        header: appBarWidget(contentController.title.value),
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.02,
          ),
          child: CustomText(
            text: contentController.content.value,
          ),
        )
      ),
    );
  }
  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }
}