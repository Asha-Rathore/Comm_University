import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.LOGO_IMAGE,
      scale: 5,
    );
  }
}