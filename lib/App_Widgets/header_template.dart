import 'dart:async';

import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderTemplate extends StatefulWidget {
  final Widget? header;
  final Widget? child;
  const HeaderTemplate({
    Key? key,
    this.header,
    this.child,
  }) : super(key: key);

  @override
  State<HeaderTemplate> createState() => _HeaderTemplateState();
}

class _HeaderTemplateState extends State<HeaderTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.GREY_COLOR,
      body: Column(
        children: [
          widget.header!,
          Expanded(child: widget.child!),
        ],
      ),
    );
  }
}
