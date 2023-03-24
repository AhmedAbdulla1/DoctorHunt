// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['id'] as int?,
      json['email'] as String?,
      json['username'] as String?,
      json['phone_number'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      json['date_birth'] as String?,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'location': instance.location,
      'date_birth': instance.dateBirth,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.userData,
      'token': instance.token,
    };

LoginAuthenticationResponse _$LoginAuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    LoginAuthenticationResponse(
      json['id'] as int?,
      json['token'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginAuthenticationResponseToJson(
        LoginAuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'token': instance.token,
    };

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) =>
    SendEmailResponse(
      json['otp'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SendEmailResponseToJson(SendEmailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'otp': instance.otp,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LiveDoctorResponse _$LiveDoctorResponseFromJson(Map<String, dynamic> json) =>
    LiveDoctorResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['image'] as String?,
      json['is_live'] as bool?,
      json['views'] as int?,
      json['avg_rating'] as String?,
      json['price'] as int?,
      json['specialist'] as String?,
    );

Map<String, dynamic> _$LiveDoctorResponseToJson(LiveDoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'is_live': instance.isLive,
      'views': instance.views,
      'avg_rating': instance.avgRating,
      'price': instance.price,
      'specialist': instance.specialist,
    };

PopularDoctorsResponse _$PopularDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    PopularDoctorsResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['image'] as String?,
      json['is_live'] as bool?,
      json['views'] as int?,
      json['avg_rating'] as String?,
      json['price'] as int?,
      json['specialist'] as String?,
    );

Map<String, dynamic> _$PopularDoctorsResponseToJson(
        PopularDoctorsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'is_live': instance.isLive,
      'views': instance.views,
      'avg_rating': instance.avgRating,
      'price': instance.price,
      'specialist': instance.specialist,
    };

FeatureDoctorsResponse _$FeatureDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    FeatureDoctorsResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['image'] as String?,
      json['is_live'] as bool?,
      json['views'] as int?,
      json['avg_rating'] as String?,
      json['price'] as int?,
      json['specialist'] as String?,
    );

Map<String, dynamic> _$FeatureDoctorsResponseToJson(
        FeatureDoctorsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'is_live': instance.isLive,
      'views': instance.views,
      'avg_rating': instance.avgRating,
      'price': instance.price,
      'specialist': instance.specialist,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['userData'] == null
          ? null
          : UserDataResponse.fromJson(json['userData'] as Map<String, dynamic>),
      (json['liveDoctors'] as List<dynamic>?)
          ?.map((e) => LiveDoctorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['popularDoctors'] as List<dynamic>?)
          ?.map(
              (e) => PopularDoctorsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['featureDoctors'] as List<dynamic>?)
          ?.map(
              (e) => FeatureDoctorsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'liveDoctors': instance.liveDoctors,
      'popularDoctors': instance.popularDoctors,
      'featureDoctors': instance.featureDoctors,
    };
