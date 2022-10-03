class OtpVerificationModel {
  final int? status;
  final String? message;

  OtpVerificationModel({
    this.status,
    this.message,
  });

  OtpVerificationModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}