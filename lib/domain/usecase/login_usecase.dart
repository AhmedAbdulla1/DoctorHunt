import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/data/network/requests.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/base_usecase.dart';


class  LoginUseCase extends BaseUseCase <LoginUseCaseInput,LoginAuthentication>{

  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, LoginAuthentication>> execute(LoginUseCaseInput input) {
    return _repository.login(LoginRequest(email: input.email, password: input.password));

  }

}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput({required this.email,required this.password});
}