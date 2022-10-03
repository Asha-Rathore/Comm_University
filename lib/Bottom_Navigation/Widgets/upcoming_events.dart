import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:flutter/material.dart';

class UpComingEventsContainer extends StatefulWidget {
  final String? image;
  final String? eventName;
  // final String? location;
  // final String? eventTime;
  final String? eventDate;
  const UpComingEventsContainer({
    Key? key,
    this.image,
    this.eventName,
    // this.location,
    this.eventDate,
    // this.eventTime,
  }) : super(key: key);

  @override
  State<UpComingEventsContainer> createState() =>
      _UpComingEventsContainerState();
}

class _UpComingEventsContainerState extends State<UpComingEventsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.015,
        left: MediaQuery.of(context).size.height * 0.015,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.50,
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.5,
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
                        fit: BoxFit.cover),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.08,
                    decoration: const BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.eventDate!,
                        style: const TextStyle(
                            color: AppColors.WHITE_COLOR,
                            fontWeight: FontWeight.bold),
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
                  customText(widget.eventName!, 10),
                ],
              ),
            ),
          ],
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
          fontWeight: FontWeight.bold),
    );
  }
}
