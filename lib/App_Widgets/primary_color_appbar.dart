import 'package:communiversity/App_Widgets/app_bar.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/search_bar.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

class PrimaryColorAppBar extends StatefulWidget {
  final String? title;
  const PrimaryColorAppBar({Key? key, this.title,}) : super(key: key);

  @override
  State<PrimaryColorAppBar> createState() => _PrimaryColorAppBarState();
}

class _PrimaryColorAppBarState extends State<PrimaryColorAppBar> {
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
            )
          ),
          
        ),
        Align(
          alignment: Alignment.topCenter,
          child: customAppBar(
            title: widget.title,
            color: AppColors.WHITE_COLOR,
          ),
        )
      ],
    );
  }
}
