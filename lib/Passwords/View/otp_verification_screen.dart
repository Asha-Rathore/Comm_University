import 'dart:async';

import 'package:communiversity/App_Widgets/app_button.dart';
import 'package:communiversity/App_Widgets/app_textField.dart';
import 'package:communiversity/App_Widgets/bottom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/Auth_Module/Widgets/header_image.dart';
import 'package:communiversity/Passwords/Controller/otp_verify_controller.dart';
import 'package:communiversity/Splash/Widgets/app_logo.dart';
import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final OtpController otpController = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: headerImageWidget(
          AssetPaths.OTP_HEAD_IMAGE, AppStrings.OTP_VERIFICATION_TEXT),
      child: Column(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: otpController.otpFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  OtpPin(),
                  SizedBox(
                    height: 35.h,
                  ),
                  Image.asset(
                    AssetPaths.TIME_ICON,
                    scale: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  GetBuilder<OtpController>(
                    builder: (builder) {
                      return Text(
                          '00 :${otpController.count} ',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        );
                    }
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  appButton(AppStrings.VERIFY_TEXT),
                ],
              ),
            ),
          ),
          Spacer(),
             GetBuilder<OtpController>(
               builder: (builder) {
                 return bottomText(
                    AppStrings.DIDNOT_RECEIVE_CODE_TEXT, AppStrings.RESEND_TEXT);
               }
             ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  Widget headerImageWidget(String headerImage, String title) {
    return HeaderImage(
      headerImage: headerImage,
      title: title,
    );
  }

  Widget OtpPin() {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: 45,
        fieldWidth: 45,
        activeFillColor: AppColors.SPLASH_COLOR,
        inactiveFillColor: AppColors.SPLASH_COLOR,
        selectedFillColor: AppColors.SPLASH_COLOR,
        activeColor: AppColors.SPLASH_COLOR,
        inactiveColor: AppColors.SPLASH_COLOR,
        selectedColor: AppColors.SPLASH_COLOR,
      ),
      showCursor: false,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
      onSaved: (value) {
        otpController.code = value!;
      },
      // validator: (value) {
      //   return FieldValidator.validateOTP(value!);
      // },
    );
  }

  Widget appButton(String text) {
    return AppButton(
      text: text,
      onTap: () {
        otpController.checkOtp();
      },
    );
  }

  Widget bottomText(String firstText, String secondText) {
    return BottomText(
      firstText: firstText,
      secondText: secondText,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (otpController.count == 0) {
          otpController.reset();
        }
      },
    );
  }
}
