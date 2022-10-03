class AddOrRemoveEventsModel {
  final int? status;
  final String? message;

  AddOrRemoveEventsModel({
    this.status,
    this.message,
  });

  AddOrRemoveEventsModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}