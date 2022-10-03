import 'package:communiversity/App_Widgets/app_bar.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatefulWidget {
  final String? headerImage;
  final String? title;
  const HeaderImage({
    Key? key,
    this.title,
    this.headerImage,
  }) : super(key: key);

  @override
  State<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // constraints: const BoxConstraints.expand(),
          child: Image.asset(widget.headerImage!,
              scale: 2,
              // AssetPaths.LOGIN_HEAD_IMAGE,
              fit: BoxFit.fill),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: customAppBar(
            title: widget.title,
            color: AppColors.BLACK_COLOR,
          ),
        )
      ],
    );
  }
}
