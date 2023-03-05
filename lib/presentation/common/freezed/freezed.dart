

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed.freezed.dart';
@freezed
class SignupObject with _$SignupObject{
  factory SignupObject(
      String name,
      String email,
      String password,
      )=_SignupObject;
}

@freezed
class RegisterAsADoctorObject with _$RegisterAsADoctorObject{
  factory RegisterAsADoctorObject(
      String name,
      String email,
      String password,
      String phone,
      String position,
      File? profilePicture,
      File? graduationCertificate,
      )=_RegisterAsADoctorObject;
}

@freezed
class LoginObject with _$LoginObject{
  factory LoginObject(
      String email,
      String password,
      )=_LoginObject;
}
@freezed
class ForgotPasswordObject with _$ForgotPasswordObject{
  factory ForgotPasswordObject(
      String email,
      String otp,
      String password,
      )=_ForgotPasswordObject;
}