import 'dart:io';

import 'package:communiversity/Edit_Profile/Controller/edit_profile_controller.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UploadPicContainer extends StatefulWidget {
  const UploadPicContainer({Key? key}) : super(key: key);

  @override
  State<UploadPicContainer> createState() => _UploadPicContainerState();
}

class _UploadPicContainerState extends State<UploadPicContainer> {
  final UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.PRIMARY_COLOR,
          width: 5,
        ),
        image: DecorationImage(
          image: box.read("profilePicture") == null
              ? updateProfileController.selestedImagePath.value == ''
                  ? const AssetImage(AssetPaths.USER_PROFILE_ICON)
                  : FileImage(
                      File(
                        updateProfileController.selestedImagePath.value,
                      ),
                    ) as ImageProvider
              : NetworkImage(
                  NetworkStrings.imageBaseUrl + box.read("profilePicture"),
                ) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
