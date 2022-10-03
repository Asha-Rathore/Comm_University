import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageContainer extends StatefulWidget {
  const MessageContainer({Key? key}) : super(key: key);

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.CHAT_SCREEN);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  AssetPaths.LOGO_IMAGE,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.JOE_BREWER_TEXT,
                  font: FontWeight.bold,
                  size: 20,
                ),
                CustomText(
                  text: AppStrings.LOREM_TEXT,
                  font: FontWeight.normal,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}