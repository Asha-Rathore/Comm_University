import 'package:communiversity/Bottom_Navigation/Widgets/menu_widget.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/search_bar.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomNavAppBar extends StatefulWidget {
  final String? title;
  final bool? visible;
  const CustomNavAppBar({Key? key, this.title, this.visible}) : super(key: key);

  @override
  State<CustomNavAppBar> createState() => _CustomNavAppBarState();
}

class _CustomNavAppBarState extends State<CustomNavAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: const BoxDecoration(
              color: AppColors.PRIMARY_COLOR,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: appBar(context),
        ),
        Visibility(
            visible: widget.visible!,
            child: widget.visible != false
                ? Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.16,
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter, child: SearchBar()),
                  )
                : Text(
                    widget.title!,
                    style: TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
      ],
    );
  }

  Widget appBar(BuildContext contexts) {
    return AppBar(
      leading: MenuWidget(),
      title: Text(
        widget.title!,
        style: const TextStyle(
          color: AppColors.WHITE_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Image.asset(
          AssetPaths.NOTIFICATION_ICON,
          color: AppColors.WHITE_COLOR,
          scale: 3,
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
