import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/data/network/requests.dart';
import 'package:doctor_hunt/data/response/responses.dart';
abstract class Repository {
   Future<Either<Failure, AuthenticationResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, AuthenticationResponse>> register(RegisterRequest registerRequest);
  // Future<Either<Failure, String>> forgotPassword(String email);
  // Future<Either<Failure, Home>> home();
  // Future<Either<Failure, StoresDetails>> storeDetails();

}
