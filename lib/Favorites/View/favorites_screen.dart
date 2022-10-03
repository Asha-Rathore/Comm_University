import 'package:communiversity/App_Widgets/custom_text.dart';
import 'package:communiversity/App_Widgets/header_template.dart';
import 'package:communiversity/App_Widgets/primary_color_appbar.dart';
import 'package:communiversity/Bottom_Navigation/Widgets/events_container.dart';
import 'package:communiversity/Events_Detail/Controller/add_or_remove_fav_controller.dart';
import 'package:communiversity/Favorites/Controller/get_all_favorites_controller.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  AddOrRemoveFavoriteController controller =
      Get.put(AddOrRemoveFavoriteController());
  final GetFavEventsController getFavEventsController =
      Get.put(GetFavEventsController());
  @override
  Widget build(BuildContext context) {
    return HeaderTemplate(
      header: appBarWidget(AppStrings.FAVORITES_TEXT),
      child: Container(
        child: getFavEventsController.favoriteEventList.isNotEmpty
            ? Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: getFavEventsController.favoriteEventList.length,
                  itemBuilder: (context, index) {
                    var favEvent = getFavEventsController
                        .favoriteEventList[index].eventId;
                    return Column(
                      children: [
                        eventContainer(
                            favEvent!.eventPictures![0],
                            favEvent.eventName!,
                            favEvent.eventLocation!.location!,
                            favEvent.eventTime!,
                            favEvent.eventTime!, () {
                          controller.addOrRemoveFav(getFavEventsController
                              .favoriteEventList[index].id!);
                          setState(() {
                            getFavEventsController.favoriteEventList
                                .remove(index);
                          });
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    );
                  },
                ))
            : Center(
                child: CustomText(
                  text: "No Favourite Events Found",
                ),
              ),
      ),
    );
  }

  Widget eventContainer(
    String image,
    String eventName,
    String eventLocation,
    String eventTime,
    String eventDate,
    Function() onTap,
  ) {
    return EventsContainer(
      image: image,
      eventName: eventName,
      eventDate: eventDate,
      eventTime: eventTime,
      location: eventLocation,
      isFav: true,
      onTap: onTap,
    );
  }

  Widget appBarWidget(String title) {
    return PrimaryColorAppBar(
      title: title,
    );
  }
}
