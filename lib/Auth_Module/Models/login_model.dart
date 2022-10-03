class LoginModel {
  final int? status;
  final String? message;
  final String? token;
  final Data? data;

  LoginModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      token = json['token'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'token' : token,
    'data' : data?.toJson()
  };
}

class Data {
  final UserLocation? userLocation;
  final String? id;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final String? profilePicture;
  final String? program;
  final dynamic address;
  final String? bio;
  final int? code;
  final int? verified;
  final String? userAuthentication;
  final dynamic userSocialToken;
  final dynamic userSocialType;
  final dynamic userDeviceType;
  final String? userDeviceToken;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Data({
    this.userLocation,
    this.id,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.profilePicture,
    this.program,
    this.address,
    this.bio,
    this.code,
    this.verified,
    this.userAuthentication,
    this.userSocialToken,
    this.userSocialType,
    this.userDeviceType,
    this.userDeviceToken,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
    : userLocation = (json['userLocation'] as Map<String,dynamic>?) != null ? UserLocation.fromJson(json['userLocation'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      userName = json['user_name'] as String?,
      userEmail = json['user_email'] as String?,
      userPassword = json['user_password'] as String?,
      profilePicture = json['profilePicture'] as String?,
      program = json['program'] as String?,
      address = json['address'],
      bio = json['bio'] as String?,
      code = json['code'] as int?,
      verified = json['verified'] as int?,
      userAuthentication = json['user_authentication'] as String?,
      userSocialToken = json['user_social_token'],
      userSocialType = json['user_social_type'],
      userDeviceType = json['user_device_type'],
      userDeviceToken = json['user_device_token'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    'userLocation' : userLocation?.toJson(),
    '_id' : id,
    'user_name' : userName,
    'user_email' : userEmail,
    'user_password' : userPassword,
    'profilePicture' : profilePicture,
    'program' : program,
    'address' : address,
    'bio' : bio,
    'code' : code,
    'verified' : verified,
    'user_authentication' : userAuthentication,
    'user_social_token' : userSocialToken,
    'user_social_type' : userSocialType,
    'user_device_type' : userDeviceType,
    'user_device_token' : userDeviceToken,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class UserLocation {
  final String? type;
  final List<dynamic>? coordinates;

  UserLocation({
    this.type,
    this.coordinates,
  });

  UserLocation.fromJson(Map<String, dynamic> json)
    : type = json['type'] as String?,
      coordinates = json['coordinates'] as List?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'coordinates' : coordinates
  };
}