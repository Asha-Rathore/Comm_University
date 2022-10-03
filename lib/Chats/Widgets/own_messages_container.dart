import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class OwnMessagesContainer extends StatefulWidget {
  const OwnMessagesContainer({super.key});

  @override
  State<OwnMessagesContainer> createState() => _OwnMessagesContainerState();
}

class _OwnMessagesContainerState extends State<OwnMessagesContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.PRIMARY_COLOR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: CustomText(
                          text: "Hey, I am Asha",
                          color: AppColors.WHITE_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    AssetPaths.LOGO_IMAGE,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.17,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                AssetPaths.TICK_ICON,
                scale: 3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              CustomText(
                text: "11:22 AM",
                color: AppColors.PRIMARY_COLOR,
                font: FontWeight.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
