import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ggggggggg");
        print(context);
        print("ggggggggg");
        ZoomDrawer.of(context)!.toggle();
      },
      child: Image.asset(
        AssetPaths.DRAWER_ICON,
        scale: 3,
      ),
    );
  }
}
