import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Auth_Module/Widgets/upload_pic_container.dart';
import 'package:communiversity/Edit_Profile/Controller/edit_profile_controller.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    updateProfileController.program.value = box.read("program");
    return HeaderTemplate(
      header: appBarWidget(AppStrings.EDIT_PROFILE_HEADING_TEXT),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: updateProfileController.editProfileFormKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  uploadImage(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  appTextField(
                      AppStrings.USER_NAME_TEXT,
                      false,
                      AssetPaths.USER_ICON,
                      updateProfileController.userNameController, 
                      (value) {
                    updateProfileController.userName = value!;
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  appTextField(AppStrings.EMAIL_TEXT, false, AssetPaths.EMAIL_ICON,
                      updateProfileController.userEmailController, (value) {
                    updateProfileController.userEmail = value!;
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  dropDown(),
                  // appTextField(
                  //     AppStrings.CHOOSE_PROGRAM_TEXT,
                  //     false,
                  //     AssetPaths.GRADUATED_ICON,
                  //     updateProfileController.programController, (value) {
                  //   updateProfileController.program = value!;
                  // }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  appTextField(
                      AppStrings.ADDRESS_TEXT,
                      false,
                      AssetPaths.LOCATION_ICON,
                      updateProfileController.addressController, (value) {
                    updateProfileController.address = value!;
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  appTextField(AppStrings.BIO_TEXT, false, AssetPaths.PASSWORD_ICON,
                      updateProfileController.bioController, (value) {
                    updateProfileController.bio = value!;
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  appButton(AppStrings.UPDATE_TEXT),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.height * 0.15,
      child: Stack(
        children: [
          UploadPicContainer(),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => bottomsheet(context),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: AppColors.WHITE_COLOR,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.PRIMARY_COLOR,
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      AssetPaths.UPLOAD_ICON,
                    ),
                    scale: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDown(){
    return CustomDropdownField(
      value: updateProfileController.program.value,
      Items: AppStrings.PROGRAMS_LISTS,
      onchange: (newItem) {
        // updateProfileController.program.value = newItem.toString();
        
      },
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }

  Widget appTextField(
    String hintText,
    bool obsecureText,
    String prefixImage,
    TextEditingController controller,
    String? Function(String?)? onSaved,
  ) {
    return AppTextField(
      prefixImage: prefixImage,
      hinttxt: hintText,
      obscuretxt: obsecureText,
      txtController: controller,
      onSaved: onSaved,
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        updateProfileController.uploadImage();
      },
    );
  }

  bottomsheet(BuildContext context) {
    return Container(
      color: AppColors.PRIMARY_COLOR,
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              print("camera");
              updateProfileController.getImage(ImageSource.camera);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.WHITE_COLOR,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.WHITE_COLOR,
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              print("gallery");
              updateProfileController.getImage(ImageSource.gallery);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(Icons.image, color: AppColors.WHITE_COLOR),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
