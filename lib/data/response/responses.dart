// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "date_birth")
  String? dateBirth;

  UserDataResponse(
    this.id,
    this.email,
    this.username,
    this.phoneNumber,
    this.image,
    this.location,
    this.dateBirth,
  );
  //form json
  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'data')
  UserDataResponse? userData;
  @JsonKey(name: 'token')
  String? token;

  AuthenticationResponse(this.userData,this.token,);


  //form json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}


@JsonSerializable()
class LoginAuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'token')
  String? token;

  LoginAuthenticationResponse(this.id,this.token,);


  //form json
  factory LoginAuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginAuthenticationResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginAuthenticationResponseToJson(this);
}


@JsonSerializable()
class SendEmailResponse extends BaseResponse {
  @JsonKey(name: "otp")
  String? otp;

  SendEmailResponse(this.otp);

  //form json
  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);
}



@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataResponse? data;

  HomeResponse(this.data);

  //from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class LiveDoctorResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'isLive')
  bool? isLive;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'avgRating')
  String? avgRating;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'specialist')
  String? specialist;


  LiveDoctorResponse(
    this.id,
    this.username,
    this.image,
    this.isLive,
    this.views,
    this.avgRating,
    this.price,
    this.specialist,
  );

  factory LiveDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveDoctorResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LiveDoctorResponseToJson(this);
}



@JsonSerializable()
class PopularDoctorsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'isLive')
  bool? isLive;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'avgRating')
  String? avgRating;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'specialist')
  String? specialist;


  PopularDoctorsResponse(
      this.id,
      this.username,
      this.image,
      this.isLive,
      this.views,
      this.avgRating,
      this.price,
      this.specialist,
      );

  factory PopularDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularDoctorsResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PopularDoctorsResponseToJson(this);
}

@JsonSerializable()
class FeatureDoctorsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'isLive')
  bool? isLive;
  @JsonKey(name: 'isLiked')
  bool? isLiked;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'avgRating')
  String? avgRating;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'specialist')
  String? specialist;


  FeatureDoctorsResponse(
      this.id,
      this.username,
      this.image,
      this.isLiked,
      this.isLive,
      this.views,
      this.avgRating,
      this.price,
      this.specialist,
      );

  factory FeatureDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$FeatureDoctorsResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$FeatureDoctorsResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: 'userData')
  UserDataResponse? userData;
  @JsonKey(name: 'livesDoctors')
  List<LiveDoctorResponse>? liveDoctors;
  @JsonKey(name: 'popularDoctors')
  List<PopularDoctorsResponse>? popularDoctors;
  @JsonKey(name: 'featureDoctors')
  List<FeatureDoctorsResponse>? featureDoctors;
  DataResponse(
    this.userData,
    this.liveDoctors,
    this.popularDoctors,
      this.featureDoctors,
  );

  //from json
  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

// @JsonSerializable()
// class StoresDetailsResponse extends BaseResponse {
//   @JsonKey(name: 'id')
//   int? id;
//   @JsonKey(name: 'image')
//   String? image;
//   @JsonKey(name: 'title')
//   String? title;
//   @JsonKey(name: 'details')
//   String? details;
//   @JsonKey(name: 'services')
//   String? services;
//   @JsonKey(name: 'about')
//   String? about;
//
//   StoresDetailsResponse(
//     this.id,
//     this.image,
//     this.title,
//     this.details,
//     this.services,
//     this.about,
//   );
//
//   //from json
//   factory StoresDetailsResponse.fromJson(Map<String, dynamic> json) =>
//       _$StoresDetailsResponseFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$StoresDetailsResponseToJson(this);
// }
