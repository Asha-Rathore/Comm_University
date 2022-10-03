import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Chats/Widgets/messages_textfield.dart';
import 'package:communiversity/Chats/Widgets/own_messages_container.dart';
import 'package:communiversity/Chats/Widgets/received_messages.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.JOE_BREWER_TEXT),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              // color: Colors.blue,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  OwnMessagesContainer(),
                  ReceivedMessagesContainer(),
                  OwnMessagesContainer(),
                  ReceivedMessagesContainer(),
                  ReceivedMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  OwnMessagesContainer(),
                  ReceivedMessagesContainer(),
                  OwnMessagesContainer(),
                  ReceivedMessagesContainer(),
                  OwnMessagesContainer(),
                  ReceivedMessagesContainer(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageTextField(),
          )
        ],
      ),
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }
}
