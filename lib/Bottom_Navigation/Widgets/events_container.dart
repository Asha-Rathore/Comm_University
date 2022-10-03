import 'package:communiversity/Utils/Routes/app_pages.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsContainer extends StatefulWidget {
  final String? image;
  final String? eventName;
  final String? location;
  final String? eventTime;
  final String? eventDate;
  final String? eventDetail;
  final String? eventId;
  final List<String> headimagesList;
  final Function()? onTap;
  final bool? isFav;
  const EventsContainer({
    Key? key,
    this.image,
    this.eventName,
    this.location,
    this.eventDate,
    this.eventTime,
    this.eventDetail,
    this.eventId,
    this.onTap,
    this.headimagesList = const [],
    this.isFav = false,
  }) : super(key: key);

  @override
  State<EventsContainer> createState() => _EventsContainerState();
}

class _EventsContainerState extends State<EventsContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.EVENT_DETAIL_SCREEN,
          arguments: [
            widget.image,
            widget.eventName,
            widget.eventDate,
            widget.eventTime,
            widget.eventDetail,
            widget.eventId,             
            widget.headimagesList,
          ],
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.015,
          left: MediaQuery.of(context).size.height * 0.015,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    // width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          NetworkStrings.imageBaseUrl + widget.image!,
                          // AssetPaths.HOME_IMAGE,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.14,
                      decoration: const BoxDecoration(
                        color: AppColors.PRIMARY_COLOR,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.eventDate!,
                            // AppStrings.JULY_02_TEXT,
                            style: const TextStyle(
                                color: AppColors.WHITE_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      widget.eventName!,
                      16,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetPaths.LOCATION_ICON,
                              scale: 4,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            customText(
                              widget.location!,
                              12,
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
                            customText(widget.eventTime!, 12)
                          ],
                        ),
                        Spacer(),
                        widget.isFav == true
                            ? InkWell(
                                onTap: widget.onTap,
                                child: Image.asset(
                                  AssetPaths.CROSS_ICON,
                                  scale: 3,
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.BLACK_COLOR,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
