import 'package:communiversity/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String? text;
  final double? size;
  final FontWeight? font;
  final Color? color;
  const CustomText({Key? key, this.font, this.size, this.text, this.color}) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      maxLines: 2,
      softWrap: true,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: widget.color ?? AppColors.BLACK_COLOR,
        fontSize: widget.size,
        fontWeight: widget.font ?? FontWeight.normal,
      ),
    );
  }
}