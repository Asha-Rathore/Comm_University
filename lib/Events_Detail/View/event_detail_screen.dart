import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Auth_Module/Controller/login_controller.dart';
import 'package:communiversity/Events_Detail/Controller/add_or_remove_fav_controller.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class EventsDetail extends StatefulWidget {
  const EventsDetail({Key? key}) : super(key: key);

  @override
  State<EventsDetail> createState() => _EventsDetailState();
}

class _EventsDetailState extends State<EventsDetail> {
  AddOrRemoveFavoriteController controller = Get.put(AddOrRemoveFavoriteController());
  dynamic args_response = Get.arguments;
  // List<String> headimagesList = args_response[6];
  // String eventId = args_response[5]; 
  // List<String> headimagesList = const [
  //   // args_response[0],
  //   // AssetPaths.LOGIN_HEAD_IMAGE,
  //   // AssetPaths.SIGNUP_HEAD_IMAGE,
  //   // AssetPaths.FORGOT_HEAD_IMAGE,
  //   NetworkStrings.imageBaseUrl + "uploads/eventPictures/2022-09-21T07-03-58.610Z1498199 (2).jpg",
  //   NetworkStrings.imageBaseUrl + "uploads/eventPictures/2022-09-21T07-03-59.359Z1498199 (1).jpg",
  //   NetworkStrings.imageBaseUrl + "uploads/eventPictures/2022-09-21T07-03-59.597Z1498199.jpg",
  // ];
  // this.headimagesList = const [],
  // List<String> headimagesList;
  @override
  Widget build(BuildContext context) {
    List<String> headimagesList = args_response[6];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ScrollPageView(
                    // scrollDirection: Axis.vertical,
                    physics: headimagesList.length == 1
                        ? NeverScrollableScrollPhysics()
                        : null,
                    indicatorColor: AppColors.DARK_GREY_COLOR,
                    checkedIndicatorColor: AppColors.PRIMARY_COLOR,
                    controller: ScrollPageController(),
                    children: headimagesList
                        .map((image) => _imageView(image))
                        .toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: appBar(),
                ),
              ],
            ),
            eventDetail(),
            eventMapLocation(),
          ],
        ),
      ),
    );
  }

  Widget _imageView(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        image: DecorationImage(
          image: NetworkImage(NetworkStrings.imageBaseUrl+ image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget eventDetail() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.WHITE_COLOR.withOpacity(0.5),
            spreadRadius: 20,
            blurRadius: 0,
            offset: Offset(0, 200), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              args_response[1],
              // AppStrings.LOREM_ISPUM_EVENT_1_TEXT,
              // widget.eventName!,
              20,
              FontWeight.bold,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AssetPaths.CALENDER_ICON,
                      scale: 4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    customText(
                      args_response[2],
                      // AppStrings.MONDAY_TEXT,
                      // widget.location!,
                      16,
                      FontWeight.normal,
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Row(
                  children: [
                    Image.asset(
                      AssetPaths.TIME_ICON,
                      scale: 4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    customText(
                      args_response[3],
                      // AppStrings.TIME_13_30_TEXT,
                      // widget.eventTime!,
                      16,
                      FontWeight.normal,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customText(
              args_response[4],
              // AppStrings.LOREM_TEXT,
              // widget.eventName!,
              20,
              FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }

  Widget customText(
    String text,
    double size,
    FontWeight font,
  ) {
    return CustomText(
      text: text,
      font: font,
      size: size,
    );
  }

  Widget eventMapLocation() {
    return Image.asset(
      AssetPaths.OTP_HEAD_IMAGE,
      scale: 3,
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Image.asset(
          AssetPaths.BACK_ICON,
          scale: 3,
          color: AppColors.WHITE_COLOR,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            // controller.productId = args_response[5];
            print("PRODUCTID");
            print(args_response[5]);
            controller.addOrRemoveFav(args_response[5]);
          },
          child: Image.asset(
            AssetPaths.FAVORITE_ICON,
            color: AppColors.WHITE_COLOR,
            scale: 3,
          ),
        )
      ],
    );
  }
}
