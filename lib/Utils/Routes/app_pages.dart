// import 'package:communiversity/Utils/Routes/app_routes.dart';

import 'package:communiversity/Auth_Module/View/login_screen.dart';
import 'package:communiversity/Auth_Module/View/signup_screen.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/bottom_navigation.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/zoom_drawer.dart';
import 'package:communiversity/Chats/View/chat_screen.dart';
import 'package:communiversity/Content/View/content_screen.dart';
import 'package:communiversity/Edit_Profile/View/edit_profile_screen.dart';
import 'package:communiversity/Events_Detail/View/event_detail_screen.dart';
import 'package:communiversity/Passwords/View/change_password_screen.dart';
import 'package:communiversity/Passwords/View/forgot_password_screen.dart';
import 'package:communiversity/Passwords/View/otp_verification_screen.dart';
import 'package:communiversity/Passwords/View/reset_password_screen.dart';
import 'package:communiversity/Splash/View/spalsh_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class Pages{
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP_SCREEN,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_SCREEN,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION_SCREEN,
      page: () => OTPScreen(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD_SCREEN,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.BOTTOM_NAVIGATION,
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE_SCREEN,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD_SCREEN,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.ZOOM_DRAWER_SCREEN,
      page: () => CustomZoomDrawer(),
    ),
    GetPage(
      name: Routes.EVENT_DETAIL_SCREEN,
      page: () => EventsDetail(),
    ),
    GetPage(
      name: Routes.CHAT_SCREEN,
      page: () => ChatScreen(),
    ),
    GetPage(
      name: Routes.CONTENT_SCREEN,
      page: () => ContentScreen(),
    ),
  ];
}