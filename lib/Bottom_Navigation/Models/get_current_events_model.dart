class EventModel {
  final int? status;
  final String? message;
  final List<Events>? events;
  EventModel({
    this.status,
    this.message,
    this.events,
  });
  EventModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      events = (json['Events'] as List?)?.map((dynamic e) => Events.fromJson(e as Map<String,dynamic>)).toList();
  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'Events' : events?.map((e) => e.toJson()).toList()
  };
}
class Events {
  final EventLocation? eventLocation;
  final String? id;
  final List<String>? eventPictures;
  final String? eventName;
  final String? eventDescription;
  final String? eventTime;
  final String? eventDate;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final List<dynamic>? favouriteEvents;
  Events({
    this.eventLocation,
    this.id,
    this.eventPictures,
    this.eventName,
    this.eventDescription,
    this.eventTime,
    this.eventDate,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.favouriteEvents,
  });
  Events.fromJson(Map<String, dynamic> json)
    : eventLocation = (json['eventLocation'] as Map<String,dynamic>?) != null ? EventLocation.fromJson(json['eventLocation'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      eventPictures = (json['eventPictures'] as List?)?.map((dynamic e) => e as String).toList(),
      eventName = json['eventName'] as String?,
      eventDescription = json['eventDescription'] as String?,
      eventTime = json['eventTime'] as String?,
      eventDate = json['eventDate'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?,
      favouriteEvents = json['favouriteEvents'] as List?;
  Map<String, dynamic> toJson() => {
    'eventLocation' : eventLocation?.toJson(),
    '_id' : id,
    'eventPictures' : eventPictures,
    'eventName' : eventName,
    'eventDescription' : eventDescription,
    'eventTime' : eventTime,
    'eventDate' : eventDate,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v,
    'favouriteEvents' : favouriteEvents
  };
}
class EventLocation {
  final String? location;
  final List<double>? coordinates;
  EventLocation({
    this.location,
    this.coordinates,
  });
  EventLocation.fromJson(Map<String, dynamic> json)
    : location = json['location'] as String?,
      coordinates = (json['coordinates'] as List?)?.map((dynamic e) => e as double).toList();
  Map<String, dynamic> toJson() => {
    'location' : location,
    'coordinates' : coordinates
  };
}