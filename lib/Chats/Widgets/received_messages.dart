import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class ReceivedMessagesContainer extends StatefulWidget {
  const ReceivedMessagesContainer({super.key});

  @override
  State<ReceivedMessagesContainer> createState() => _ReceivedMessagesContainerState();
}

class _ReceivedMessagesContainerState extends State<ReceivedMessagesContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
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
                          color: AppColors.WHITE_COLOR,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: CustomText(
                          text: "Hey",
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.17,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "5:32 PM",
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
