import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/Bottom_Navigation/Controller/get_previous_events_controller.dart';
import 'package:communiversity/Bottom_Navigation/Controller/get_upcoming_events_controller.dart';
import 'package:communiversity/Bottom_Navigation/Models/get_previous_events_model.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/events_container.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/tabBar.dart';
import 'package:communiversity/Utils/app_colors.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final GetUpComingEventsController getUpComingEventsController =
      Get.put(GetUpComingEventsController());
  final GetPreviousEventsController getPreviousEventsController =
      Get.put(GetPreviousEventsController());
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          // left: MediaQuery.of(context).size.height * 0.02,
          // right: MediaQuery.of(context).size.height * 0.02,
        ),
        child: tabBar());
  }

  Widget tabBar() {
    return CustomTabBar(
      firstTabView: upComingEvents(),
      secondTabView: previousEvents(),
    );
  }

  Widget upComingEvents() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            side: const BorderSide(
              color: AppColors.BLACK_COLOR,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            checkColor: AppColors.BLACK_COLOR,
            activeColor: AppColors.GREY_COLOR,
            tristate: false,
            //fillColor: MaterialStateProperty.resolveWith(),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            title: const Text(
              AppStrings.VIEW_ONLY_FAVORITES_TEXT,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            secondary: const Icon(
              Icons.filter_alt_rounded,
              color: AppColors.PRIMARY_COLOR,
            ),
          ),
        ),
        Expanded(
          child: getUpComingEventsController.upcomingEventList.isNotEmpty
              ? Obx(
                  () => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          getUpComingEventsController.upcomingEventList.length,
                      itemBuilder: (context, index) {
                        var upcomingEvents =
                            getUpComingEventsController.upcomingEventList;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: EventsContainer(
                            image: upcomingEvents[index].eventPictures![0],
                            eventName: upcomingEvents[index].eventName,
                            eventDate: upcomingEvents[index].eventDate,
                            eventTime: upcomingEvents[index].eventTime,
                            location:
                                upcomingEvents[index].eventLocation!.location,
                          ),
                        );
                      }),
                )
              : const Center(
                  child: CustomText(
                    text: "No Events Found",
                  ),
                ),
        ),
      ],
    );
  }

  Widget previousEvents() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            side: const BorderSide(
              color: AppColors.BLACK_COLOR,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            checkColor: AppColors.BLACK_COLOR,
            activeColor: AppColors.GREY_COLOR,
            tristate: false,
            //fillColor: MaterialStateProperty.resolveWith(),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            title: const Text(
              AppStrings.VIEW_ONLY_FAVORITES_TEXT,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            secondary: const Icon(
              Icons.filter_alt_rounded,
              color: AppColors.PRIMARY_COLOR,
            ),
          ),
        ),
        Expanded(
          child: getPreviousEventsController.previousEventList.isNotEmpty
              ? Obx(
                  () => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount:
                        getPreviousEventsController.previousEventList.length,
                    itemBuilder: (context, index) {
                      var previousEvents =
                          getPreviousEventsController.previousEventList;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: EventsContainer(
                          image: previousEvents[index].eventPictures![0],
                          eventName: previousEvents[index].eventName,
                          eventDate: previousEvents[index].eventDate,
                          eventTime: previousEvents[index].eventTime,
                          location:
                              previousEvents[index].eventLocation!.location,
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: CustomText(
                    text: "No Events Found",
                  ),
                ),
        ),
      ],
    );
  }
}
