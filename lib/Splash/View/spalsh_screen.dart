import 'dart:async';

import 'package:communiversity/Auth_Module/View/login_screen.dart';
import 'package:communiversity/Splash/Controller/splash_controller.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => SplashController.checkToken()
    );
  }
  
  var visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.SPLASH_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            splashImage(AssetPaths.SPLASH_1_IMAGE, 3),
            Center(
              child: Entry.scale(
                visible: visible,
                duration: const Duration(seconds: 1),
                child: const AppLogo(),
              ),
            ),
            splashImage(AssetPaths.SPLASH_2_IMAGE, 3),
          ],
        ),
      ),
    );
  }

  Widget splashImage(String image, double scale) {
    return Image.asset(
      image,
      scale: scale,
      // fit: BoxFit.fitWidth,
      //AssetPaths.SPLASH_1_IMAGE
    );
  }
}
