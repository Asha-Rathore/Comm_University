import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class MenuItems{
  static const HOME_SCREEN = MenuScreenDetails(
    AppStrings.HOME_TEXT,
    AssetPaths.HOME_TRANSPARENT_ICON
  );
  static const TAR_HEEL_TRACKS_SCREEN = MenuScreenDetails(
    AppStrings.TAR_HEEL_TRACK_TEXT,
    AssetPaths.HEEL_TRANSPARENT_ICON
  );
  static const MY_MESSAGES_SCREEN = MenuScreenDetails(
    AppStrings.MY_MESSAGES_TEXT,
    AssetPaths.MESSAGE_TRANSPARENT_ICON
  );
  static const FAVORITE_SCREEN = MenuScreenDetails(
    AppStrings.FAVORITES_TEXT,
    AssetPaths.FAVORITE_TRANSPARENT_ICON
  );
  static const SETTINGS_SCREEN = MenuScreenDetails(
    AppStrings.SETTINGS_TEXT,
    AssetPaths.SETTING_TRANSPARENT_ICON
  );
  static const TERMS_CONDITION_SCREEN = MenuScreenDetails(
    AppStrings.TERMS_CONDITIONS_TEXT,
    AssetPaths.TERMS_TRANSPARENT_ICON
  );
  static const PRIVACY_POLICY_SCREEN = MenuScreenDetails(
    AppStrings.PRIVACY_POLICY_TEXT,
    AssetPaths.PRIVACY_TRANSPARENT_ICON
  );
  static const SINGOUT_SCREEN = MenuScreenDetails(
    AppStrings.SIGNOUT_TEXT,
    AssetPaths.SIGNOUT_TRANSPARENT_ICON
  );

  static final all = <MenuScreenDetails>[
    HOME_SCREEN,
    TAR_HEEL_TRACKS_SCREEN,
    MY_MESSAGES_SCREEN,
    FAVORITE_SCREEN,
    SETTINGS_SCREEN,
    TERMS_CONDITION_SCREEN,
    PRIVACY_POLICY_SCREEN,
    SINGOUT_SCREEN
  ];
}

class MenuScreenDetails{
  final String? title;
  final String image;
  const MenuScreenDetails(this.title, this.image);
}