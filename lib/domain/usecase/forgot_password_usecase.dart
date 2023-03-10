import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, SendEmail> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, SendEmail>> execute(String input) async {
    return await _repository.sendEmail(input);
  }
}
