import 'dart:async';

import 'package:doctor_hunt/domain/usecase/login_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  final StreamController _visibilityController =
      StreamController<bool>.broadcast();
  final StreamController _areInputValidController =
      StreamController<void>.broadcast();

  LoginObject _loginObject = LoginObject('', '');
  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputAreAllInputValid => _areInputValidController.sink;

  @override
  Sink get inputEmailValid => _emailController.sink;

  @override
  Sink get inputPassword => _passwordController.sink;

  @override
  Sink get inputPasswordVisible => _visibilityController.sink;

  @override
  login() {
    _loginUseCase
        .execute(LoginUseCaseInput(_loginObject.email, _loginObject.password));
  }

  @override
  Stream<bool> get outAreAllInputValid =>
      _areInputValidController.stream.map((_) => _areinputValid());

  @override
  Stream<bool> get outEmailIsValid =>
      _emailController.stream.map((email) => _emailIsValid(email));

  @override
  Stream<bool> get outPasswordIsValid =>
      _passwordController.stream.map((password) => _passwordIsValid(password));

  @override
  Stream<bool> get outPasswordIsVisible =>
      _visibilityController.stream.map((visible) => visible);

  @override
  setEmail(String email) {
    _emailController.add(email);
    if (_passwordIsValid(email)) {
      _loginObject = _loginObject.copyWith(
        email: email,
      );
    } else {
      _loginObject = _loginObject.copyWith(
        email: "",
      );
    }
    _areInputValidController.add(null);
  }

  @override
  setPassword(String password) {
    _passwordController.add(password);
    if (_passwordIsValid(password)) {
      _loginObject = _loginObject.copyWith(
        password: password,
      );
    } else {
      _loginObject = _loginObject.copyWith(
        password: "",
      );
    }
    _areInputValidController.add(null);
  }

  @override
  setVisibility(bool visible) {
    _visibilityController.add(visible);
  }

  bool _emailIsValid(String email) {
    return email.isNotEmpty;
  }

  bool _passwordIsValid(String password) {
    return password.isNotEmpty;
  }

  bool _areinputValid() {
    return _emailIsValid(_loginObject.email) &&
        _passwordIsValid(_loginObject.password);
  }
}

abstract class LoginViewModelInput {
  setEmail(String email);

  setPassword(String password);

  setVisibility(bool visible);

  login();

  Sink get inputEmailValid;

  Sink get inputPassword;

  Sink get inputPasswordVisible;

  Sink get inputAreAllInputValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outEmailIsValid;

  Stream<bool> get outPasswordIsValid;

  Stream<bool> get outPasswordIsVisible;

  Stream<bool> get outAreAllInputValid;
}
