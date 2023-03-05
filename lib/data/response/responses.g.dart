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
      json['detail'] as String?,
    );

Map<String, dynamic> _$SendEmailResponseToJson(SendEmailResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
