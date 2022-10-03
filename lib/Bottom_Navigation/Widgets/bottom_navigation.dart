import 'package:communiversity/Bottom_Navigation/Views/events_screen.dart';
import 'package:communiversity/Bottom_Navigation/Views/game_screen.dart';
import 'package:communiversity/Bottom_Navigation/Views/home_screen.dart';
import 'package:communiversity/Bottom_Navigation/Views/profile_screen.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/custom_appbar.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  late bool isSearch = false;

  @override
  void initState() {
    setState(() {
      if(pageIndex == 0 || pageIndex == 2){
      isSearch = true;
    }
    else{
      isSearch = false;
    }
    });
    
    super.initState();
  }

  static const List titles = [
    AppStrings.HOME_TEXT,
    AppStrings.GAME_TEXT,
    AppStrings.EVENTS_TEXT,
    AppStrings.PROFILE_TEXT,
  ];

  final pages = [
    HomeScreen(),
    GameScreen(),
    EventScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.GREY_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNavAppBar(
            title: titles[pageIndex],
            visible: isSearch,
          ),
          Expanded(child: pages[pageIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: AppColors.WHITE_COLOR,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: pageIndex == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.004,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Image.asset(
                          AssetPaths.HOME_SELECTED_ICON,
                          scale: 3,
                          //color: AppColors.WHITE_COLOR,
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.HOME_UNSELECTED_ICON,
                      scale: 3,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: pageIndex == 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.004,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Image.asset(
                          AssetPaths.GAME_SELECTED_ICON,
                          scale: 3,
                          //color: AppColors.WHITE_COLOR,
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.GAME_UNSELECTED_ICON,
                      scale: 3,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: pageIndex == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.004,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Image.asset(
                          AssetPaths.EVENT_SELECT_ICON,
                          scale: 3,
                          //color: AppColors.WHITE_COLOR,
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.EVENT_UNSELECTED_ICON,
                      scale: 3,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: pageIndex == 3
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.004,
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Image.asset(
                          AssetPaths.PROFILE_SELECTED_ICON,
                          scale: 3,
                          //color: AppColors.WHITE_COLOR,
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.PROFILE_UNSELECTED_ICON,
                      scale: 3,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
