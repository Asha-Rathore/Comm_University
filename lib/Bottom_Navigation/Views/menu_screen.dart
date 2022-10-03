import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/menu_items.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class MenuScreen extends StatelessWidget {
  final MenuScreenDetails currentItem;
  final ValueChanged onSelectedItem;
  MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 0.20.sw,
                // height: 0.10.sh,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 183, 171),
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: box.read("profilePicture") == null
                        ? AssetImage(
                            AssetPaths.USER_PROFILE_ICON,
                          )
                        : NetworkImage(
                            NetworkStrings.imageBaseUrl +
                                box.read("profilePicture"),
                          ) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: box.read("user_name") ?? "",
                      font: FontWeight.bold,
                      color: AppColors.WHITE_COLOR,
                      size: 20,
                    ),
                    CustomText(
                      text: box.read("user_email") ?? "",
                      font: FontWeight.normal,
                      color: AppColors.WHITE_COLOR,
                      size: 18,
                    ),
                    CustomText(
                      text: box.read("address") ?? "",
                      font: FontWeight.normal,
                      color: AppColors.WHITE_COLOR,
                      size: 18,
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          ...MenuItems.all.map(buildMenuItem).toList(),
          const Spacer(
            flex: 1,
          ),
        ],
      )),
    );
  }

  Widget buildMenuItem(MenuScreenDetails item) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      selectedTileColor: Color.fromARGB(255, 14, 94, 94),
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Image.asset(item.image, scale: 3),
      title: CustomText(
        text: item.title,
        color: AppColors.WHITE_COLOR,
      ),
      onTap: () {
        onSelectedItem(item);
      },
    );
  }
}
