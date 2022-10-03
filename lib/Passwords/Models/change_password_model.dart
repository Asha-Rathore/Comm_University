class ChangeOlderPasswordModel {
  final int? status;
  final String? message;

  ChangeOlderPasswordModel({
    this.status,
    this.message,
  });

  ChangeOlderPasswordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}