import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/Auth_Module/Widgets/upload_pic_container.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Center(
              child: UploadPicContainer(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(AppStrings.NAME_TEXT, 22, FontWeight.bold),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            customText(box.read("user_name")??"", 18, FontWeight.normal),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(AppStrings.EMAIL_TEXT, 22, FontWeight.bold),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            customText(box.read("user_email")??"", 18, FontWeight.normal),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(AppStrings.PROGRAM_ENROLLED_TEXT, 22, FontWeight.bold),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            customText(box.read("program")??"", 18, FontWeight.normal),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(AppStrings.ADDRESS_TEXT, 22, FontWeight.bold),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            customText(
                box.read("address")??"", 18, FontWeight.normal),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(AppStrings.BIO_TEXT, 22, FontWeight.bold),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            customText(box.read("bio")??"", 18, FontWeight.normal),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: appButton(
                AppStrings.EDIT_PROFILE_TEXT,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget customText(String text, double size, FontWeight font) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.BLACK_COLOR,
        fontSize: size,
        fontWeight: font,
      ),
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        Get.toNamed(Routes.EDIT_PROFILE_SCREEN);
      },
    );
  }
}
