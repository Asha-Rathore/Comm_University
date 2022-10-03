import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customAppBar extends StatefulWidget {
  final String? title;
  final Color? color;
  const customAppBar({Key? key, this.title, this.color,}) : super(key: key);

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: (){
          Get.back();
        },
        child: Image.asset(
          AssetPaths.BACK_ICON,
          scale: 3,
          color: widget.color,
        ),
      ),
      title: Text(
        widget.title!,
        style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}