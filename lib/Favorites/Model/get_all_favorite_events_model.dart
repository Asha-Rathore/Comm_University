class GetFavouriteEventsModel {
  final int? status;
  final String? message;
  final List<Favourites>? favourites;

  GetFavouriteEventsModel({
    this.status,
    this.message,
    this.favourites,
  });

  GetFavouriteEventsModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      favourites = (json['favourites'] as List?)?.map((dynamic e) => Favourites.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'favourites' : favourites?.map((e) => e.toJson()).toList()
  };
}

class Favourites {
  final String? id;
  final EventId? eventId;
  final String? userId;
  final int? v;

  Favourites({
    this.id,
    this.eventId,
    this.userId,
    this.v,
  });

  Favourites.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      eventId = (json['eventId'] as Map<String,dynamic>?) != null ? EventId.fromJson(json['eventId'] as Map<String,dynamic>) : null,
      userId = json['userId'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'eventId' : eventId?.toJson(),
    'userId' : userId,
    '__v' : v
  };
}

class EventId {
  final EventLocation? eventLocation;
  final String? id;
  final List<String>? eventPictures;
  final String? eventName;
  final String? eventTime;

  EventId({
    this.eventLocation,
    this.id,
    this.eventPictures,
    this.eventName,
    this.eventTime,
  });

  EventId.fromJson(Map<String, dynamic> json)
    : eventLocation = (json['eventLocation'] as Map<String,dynamic>?) != null ? EventLocation.fromJson(json['eventLocation'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      eventPictures = (json['eventPictures'] as List?)?.map((dynamic e) => e as String).toList(),
      eventName = json['eventName'] as String?,
      eventTime = json['eventTime'] as String?;

  Map<String, dynamic> toJson() => {
    'eventLocation' : eventLocation?.toJson(),
    '_id' : id,
    'eventPictures' : eventPictures,
    'eventName' : eventName,
    'eventTime' : eventTime
  };
}

class EventLocation {
  final String? location;

  EventLocation({
    this.location,
  });

  EventLocation.fromJson(Map<String, dynamic> json)
    : location = json['location'] as String?;

  Map<String, dynamic> toJson() => {
    'location' : location
  };
}