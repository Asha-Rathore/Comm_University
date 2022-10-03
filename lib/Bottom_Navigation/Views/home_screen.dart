import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Bottom_Navigation/Controller/get_current_events_controller.dart';
import 'package:communiversity/Bottom_Navigation/Controller/get_upcoming_events_controller.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/events_container.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/upcoming_events.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetCurrentEventsController getCurrentEventsController =
      Get.put(GetCurrentEventsController());
  final GetUpComingEventsController getUpComingEventsController =
      Get.put(GetUpComingEventsController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.015,
              left: MediaQuery.of(context).size.height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customText("Hi ", 22),
                    customText(box.read("user_name") ?? "", 22),
                    customText("! ", 22),
                    Image.asset(
                      AssetPaths.GREETING_ICON,
                      scale: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                customText(AppStrings.CURRENT_EVENT_TEXT, 18),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Obx(
              () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: getCurrentEventsController.currentEventList.length,
                itemBuilder: (context, index) {
                  var event = getCurrentEventsController.currentEventList;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: eventContainer(
                      event[index].eventPictures![0],
                      event[index].eventName!,
                      event[index].eventLocation!.location!,
                      event[index].eventTime!,
                      event[index].eventDate!,
                      event[index].eventDescription!,
                      event[index].id!,
                      event[index].eventPictures!,
                    ),
                  );
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.02,
          // ),
          // Center(
          //   child: eventContainer(),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.015,
              left: MediaQuery.of(context).size.height * 0.015,
            ),
            child: customText(AppStrings.UPCOMING_EVENTS_TEXT, 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          upComingEvents(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }

  Widget customText(String text, double size) {
    return CustomText(
      text: text,
      color: AppColors.BLACK_COLOR,
      size: size,
      font: FontWeight.bold,
    );
  }

  Widget eventContainer(
    String image,
    String eventName,
    String eventLocation,
    String eventTime,
    String eventDate,
    String eventDetail,
    String eventId,
    List<String> headimagesList,
  ) {
    return EventsContainer(
      image: image,
      eventName: eventName,
      eventDate: eventDate,
      eventTime: eventTime,
      location: eventLocation,
      eventDetail: eventDetail,
      eventId: eventId,
      headimagesList: headimagesList,
    );
  }

  Widget upComingEvents() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: getUpComingEventsController.upcomingEventList.length,
            itemBuilder: (context, index) {
              var upcomingEvents =
                  getUpComingEventsController.upcomingEventList;
              return UpComingEventsContainer(
                image: upcomingEvents[index].eventPictures![0],
                eventName: upcomingEvents[index].eventName,
                eventDate: upcomingEvents[index].eventDate,
              );
            }),
      ),
    );
  }
}
