import 'package:communiversity/Bottom_Navigation/Controller/logout_controller.dart';
import 'package:communiversity/Bottom_Navigation/Views/home_screen.dart';
import 'package:communiversity/Bottom_Navigation/Views/menu_screen.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/bottom_navigation.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/menu_items.dart';
import 'package:communiversity/Content/Controller/content_controller.dart';
import 'package:communiversity/Content/View/content_screen.dart';
import 'package:communiversity/Favorites/View/favorites_screen.dart';
import 'package:communiversity/Messages/Views/messages_screen.dart';
import 'package:communiversity/Settings/View/settings_screen.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

final ZoomDrawerController z = ZoomDrawerController();

class CustomZoomDrawer extends StatefulWidget {
  const CustomZoomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomZoomDrawer> createState() => _CustomZoomDrawerState();
}

class _CustomZoomDrawerState extends State<CustomZoomDrawer> {

  final LogoutController logoutController = Get.put(LogoutController());
  ContentController contentController = Get.put(ContentController());
  MenuScreenDetails menuDetail = MenuItems.HOME_SCREEN;
  Object? getScreen(context){
    switch (menuDetail){
      case MenuItems.HOME_SCREEN:
        ZoomDrawer.of(context)!.close();
        break;

      case MenuItems.TAR_HEEL_TRACKS_SCREEN:
        Get.to(CustomZoomDrawer());
        break;

      case MenuItems.MY_MESSAGES_SCREEN:
        Get.to(MessageScreen());
        break;

      case MenuItems.FAVORITE_SCREEN:
        Get.to(FavoriteScreen());
        break;

      case MenuItems.SETTINGS_SCREEN:
        Get.to(SettingsScreen());
        break;

      case MenuItems.TERMS_CONDITION_SCREEN: 
        contentController.GetTerms();
        break;

      case MenuItems.PRIVACY_POLICY_SCREEN:
        contentController.GetPrivacy();
        break;

      case MenuItems.SINGOUT_SCREEN:
        logoutController.logOut();
        break;

      default:
        Get.to(BottomNavBar());
        break;
    }
  }
       
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      menuBackgroundColor: AppColors.PRIMARY_COLOR,
      controller: z,
      menuScreen: Builder(
        builder: (context) {
          return MenuScreen(
            currentItem: menuDetail,
            onSelectedItem: (item){
              setState(() {
                menuDetail = item;
              });
              getScreen(context);
            },
          );
        }
      ), 
      mainScreen: BottomNavBar(),
    );
  }
}