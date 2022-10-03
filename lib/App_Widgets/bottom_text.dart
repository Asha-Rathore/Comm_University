import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';

class BottomText extends StatefulWidget {
  final String? firstText;
  final String? secondText;
  final Function()? onTap;
  const BottomText({Key? key, this.firstText, this.secondText, this.onTap,}) : super(key: key);

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: RichText(
        text: TextSpan(
          text: widget.firstText,
          style: const TextStyle(
            color: AppColors.BLACK_COLOR
          ),
          children: [
            TextSpan(
              text: widget.secondText,
              style: const TextStyle(
                color: AppColors.BLACK_COLOR,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
      ),
    );
  }
}