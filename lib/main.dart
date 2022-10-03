import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:communiversity/Splash/View/spalsh_screen.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Comm University',
            navigatorObservers: [BotToastNavigatorObserver()],
            builder: BotToastInit(),
            initialRoute: Pages.INITIAL,
            getPages: Pages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Constants.APP_FONT_FAMILY,
              primaryColor: AppColors.PRIMARY_COLOR,
              // primarySwatch: Colors.blue,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: AppColors.PRIMARY_COLOR, //<-- SEE HERE
                    displayColor: AppColors.PRIMARY_COLOR, //<-- SEE HERE
                  ),
            ),
            home: const SplashScreen(),
            // home: MessageScreen(),
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}