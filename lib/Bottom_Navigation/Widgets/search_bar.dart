import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.WHITE_COLOR,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Form(
        //key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            style: const TextStyle(
              color: AppColors.BLACK_COLOR,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  AssetPaths.SEARCH_ICON,
                  scale: 3,
                ),
              ),
              border: InputBorder.none,
              hintText: AppStrings.SEARCH_TEXT,
              hintStyle: const TextStyle(
                color: AppColors.GREY_COLOR,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
