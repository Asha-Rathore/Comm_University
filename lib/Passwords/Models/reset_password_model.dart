class ChangePasswordModel {
  final int? status;
  final String? message;

  ChangePasswordModel({
    this.status,
    this.message,
  });

  ChangePasswordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}