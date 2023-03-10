import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/data/network/requests.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:doctor_hunt/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, LoginAuthentication>> login(
      LoginRequest loginRequest);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure,SendEmail>>sendEmail(String email);
  Future<Either<Failure,String>>checkOtp(String otp);
  Future<Either<Failure, String>> forgotPassword(String email);

// Future<Either<Failure, String>> forgotPassword(String email);
// Future<Either<Failure, Home>> home();
// Future<Either<Failure, StoresDetails>> storeDetails();
}
