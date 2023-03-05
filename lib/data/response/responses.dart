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
class SendEmailResponse {
  @JsonKey(name: "detail")
  String? detail;

  SendEmailResponse(this.detail);

  //form json
  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);
}

// @JsonSerializable()
// class HomeResponse extends BaseResponse {
//   @JsonKey(name: 'data')
//   DataResponse? data;
//
//   HomeResponse(this.data);
//
//   //from json
//   factory HomeResponse.fromJson(dynamic json) => _$HomeResponseFromJson(json);
//
//   // to json
//   Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
// }
//
// @JsonSerializable()
// class ServicesResponse {
//   @JsonKey(name: 'id')
//   int? id;
//   @JsonKey(name: 'title')
//   String? title;
//   @JsonKey(name: 'image')
//   String? image;
//
//   ServicesResponse(
//     this.id,
//     this.title,
//     this.image,
//   );
//
//   factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
//       _$ServicesResponseFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
// }

// @JsonSerializable()
// class BannersResponse {
//   @JsonKey(name: 'id')
//   int? id;
//   @JsonKey(name: 'link')
//   String? link;
//   @JsonKey(name: 'title')
//   String? title;
//   @JsonKey(name: 'image')
//   String? image;
//
//   BannersResponse(
//     this.id,
//     this.link,
//     this.title,
//     this.image,
//   );
//
//   factory BannersResponse.fromJson(Map<String, dynamic> json) =>
//       _$BannersResponseFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
// }

// @JsonSerializable()
// class StoresResponse {
//   @JsonKey(name: 'id')
//   int? id;
//   @JsonKey(name: 'title')
//   String? title;
//   @JsonKey(name: 'image')
//   String? image;
//
//   StoresResponse(
//     this.id,
//     this.title,
//     this.image,
//   );
//
//   factory StoresResponse.fromJson(Map<String, dynamic> json) =>
//       _$StoresResponseFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
// }

// @JsonSerializable()
// class DataResponse {
//   @JsonKey(name: 'services')
//   List<ServicesResponse>? services;
//   @JsonKey(name: 'banners')
//   List<BannersResponse>? banners;
//   @JsonKey(name: 'stores')
//   List<StoresResponse>? stores;
//
//   DataResponse(
//     this.services,
//     this.banners,
//     this.stores,
//   );
//
//   //from json
//   factory DataResponse.fromJson(Map<String, dynamic> json) =>
//       _$DataResponseFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$DataResponseToJson(this);
// }
//
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
