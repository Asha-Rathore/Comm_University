import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDropdownField extends StatefulWidget {
  List? Items;
  String? value;
  Function(String?)? onchange;
  CustomDropdownField({Key? key, this.Items, this.onchange, this.value})
      : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {

  late FocusNode myFocusNode = new FocusNode();
  @override
  void initState() {
    // myFocusNode
    myFocusNode.addListener(() {
      setState(() {});
    });
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
      decoration: BoxDecoration(
        color: AppColors.SPLASH_COLOR,
      borderRadius: BorderRadius.circular(35) ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          focusNode: myFocusNode,
          value: widget.value,
          isExpanded: true,
          icon: const Padding(
            padding: EdgeInsets.only(right:28.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          elevation: 16,
          style: TextStyle(color: AppColors.BLACK_COLOR, fontSize: 20.sp),
          onChanged: widget.onchange,
          decoration: InputDecoration(
            prefixIcon:
               Padding(
                  padding: EdgeInsets.only(
                      left: 25.w, right: 10.w),
                  child:
                      Image.asset(AssetPaths.GRADUATED_ICON, width:  28.0.w)),
          prefixIconConstraints: BoxConstraints(),
                      border: InputBorder.none,
            label: CustomText(
              text: "Choose Program", 
              color: myFocusNode.hasFocus
                  ? AppColors.PRIMARY_COLOR
                  : AppColors.GREY_COLOR, 
              size: 20,
            ),
          ),
          items: widget.Items!.map<DropdownMenuItem<String>>((dynamic item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 15.sp),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}