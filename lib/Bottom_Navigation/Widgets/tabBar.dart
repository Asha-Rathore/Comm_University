import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final Widget firstTabView;
  final Widget secondTabView;
  const CustomTabBar({
    Key? key,
    required this.firstTabView,
    required this.secondTabView,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TabBar(
            indicatorColor: AppColors.PRIMARY_COLOR,
            indicatorWeight: 5.0,
            labelColor: AppColors.PRIMARY_COLOR,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: const [
              Text(
                AppStrings.UPCOMING_EVENTS_TEXT,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppStrings.PREVIOUS_EVENTS_TEXT,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: [
            widget.firstTabView,
            widget.secondTabView,
          ],
        )),
      ],
    );
  }
}