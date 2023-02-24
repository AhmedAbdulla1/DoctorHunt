

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
class LoginObject with _$LoginObject{
  factory LoginObject(
      String email,
      String password,
      )=_LoginObject;
}

