import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/data/network/requests.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/base_usecase.dart';

class RegisterUseCase extends BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(RegisterUseCaseInput input) {
    return _repository.register(RegisterRequest(
      name: input.name,
      email: input.email,
      password: input.password,
    ));
  }
}

class RegisterUseCaseInput {
  final String name;

  final String email;
  final String password;

  RegisterUseCaseInput({
    required this.name,
    required this.email,
    required this.password,
  });
}
