import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/base_usecase.dart';

class SignAsDoctorUseCase
    extends BaseUseCase<SignAsDoctorUseCaseInput, AuthenticationResponse> {
  Repository _repository ;
  SignAsDoctorUseCase(this._repository);
  @override
  Future<Either<Failure, AuthenticationResponse>> execute(
      SignAsDoctorUseCaseInput input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}

class SignAsDoctorUseCaseInput {
  final String name;
  final String email;
  final String password;
  final String position;
  final String phone;
  final File graduationCertificate;
  final File profilePicture;

  SignAsDoctorUseCaseInput({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.position,
    required this.profilePicture,
    required this.graduationCertificate,
  });
}
