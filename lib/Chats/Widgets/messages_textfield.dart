import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({super.key});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.WHITE_COLOR,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: AppStrings.TYPE_MESSAGE_HERE_TEXT,
          labelStyle: TextStyle(
            color: AppColors.GREY_COLOR,
          ),
          border: InputBorder.none,
          prefixIcon: Image.asset(
            AssetPaths.CHAT_UPLOAD_ICON,
            scale: 3,
          ),
          suffixIcon: Image.asset(
            AssetPaths.SEND_CHAT_ICON,
            scale: 3,
          ),
        ),
      ),
    );
  }
}
