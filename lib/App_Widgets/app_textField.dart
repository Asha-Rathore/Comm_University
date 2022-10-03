import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final String hinttxt;
  final bool? enabled;
  final TextEditingController? txtController;
  final bool? obscuretxt;
  final String? Function(String?)? validator;
  final String? prefixImage;
  final void Function()? onclick;
  final String? Function(String?)? onSaved;
  final Icon? sufixicon;
  const AppTextField(
      {Key? key,
      this.enabled = true,
      required this.hinttxt,
      this.txtController,
      this.obscuretxt = false,
      this.validator,
      this.prefixImage,
      this.onclick,
      this.onSaved,
      this.sufixicon})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode myFocusNode = new FocusNode();
  @override
  void initState() {
    // myFocusNode
    myFocusNode.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: MediaQuery.of(context).size.width * 0.85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.SPLASH_COLOR,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: TextFormField(
          enabled: widget.enabled,
            focusNode: myFocusNode,
            obscureText: widget.obscuretxt!,
            controller: widget.txtController,
            style: TextStyle(
              color: AppColors.BLACK_COLOR,
              fontSize: 20.sp,
            ),
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.only(left: 20.w),
              suffixIcon: Visibility(
                visible: widget.obscuretxt!,
                child: GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.only(right: 15, top: 6, bottom: 6),
                      child: FieldValidator.isHidepassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(
                                Icons.visibility,
                                color: AppColors.PRIMARY_COLOR,
                              ),
                      // child: Image.asset(
                      //   widget.sufixicon!,
                      //   width: 2.0,
                      // )
                      ),
                      onTap: () {
                          FieldValidator.password_hideIcon();
                        },
                ),
              ),
              suffixIconColor: myFocusNode.hasFocus
                  ? AppColors.PRIMARY_COLOR
                  : AppColors.GREY_COLOR,
              prefixIcon: Image.asset(
                widget.prefixImage!,
                // AssetPaths.EMAIL_ICON,
                scale: 3,
              ),
              prefixIconColor: myFocusNode.hasFocus
                  ? AppColors.PRIMARY_COLOR
                  : AppColors.GREY_COLOR,
              border: InputBorder.none,
              labelText: widget.hinttxt,
              labelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? AppColors.PRIMARY_COLOR
                    : AppColors.GREY_COLOR,
                fontSize: 20.sp,
              ),
            ),
            onSaved: widget.onSaved!,
            validator: widget.validator
          ),
      ),
    );
  }
}
