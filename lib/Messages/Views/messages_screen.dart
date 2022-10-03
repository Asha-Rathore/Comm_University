import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Messages/Widgets/message_container.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.MESSAGES_TEXT),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Container(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
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
              }),
        ),
      ),
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }
}
