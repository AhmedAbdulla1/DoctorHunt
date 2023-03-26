import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/data/network/failure.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/base_usecase.dart';


class HomeUseCase extends BaseUseCase <void, Home> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, Home>> execute( void input) {
    return _repository.home();
  }
}
