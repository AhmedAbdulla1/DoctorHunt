import 'dart:async';

import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/domain/usecase/login_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';

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
  final StreamController<bool> isUserLoginSuccessfullyStreamController =
      StreamController.broadcast();
  LoginObject _loginObject = LoginObject('', '');
  final LoginUseCase _loginUseCase;

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
  login() async {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.popupLoadingState,
      ),
    );
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        email: _loginObject.email,
        password: _loginObject.password,
      ),
    ))
        .fold((failure) {
      inputState.add(
        ErrorState(
          stateRenderType: StateRenderType.popupErrorState,
          message: failure.message,
        ),
      );
    }, (data) {
      inputState.add(
        ContentState(),
      );
      print(data.token);
      Constant.token="Token ${data.token}";
      isUserLoginSuccessfullyStreamController.add(true);
    });
  }

  @override
  Stream<bool> get outAreAllInputValid =>
      _areInputValidController.stream.map((_) => _areInputValid());

  @override
  Stream<String?> get outEmailIsValid =>
      _emailController.stream.map((email) => _emailOutError(email));

  @override
  Stream<String?> get outPasswordIsValid =>
      _passwordController.stream.map((password) => _passwordOutError(password));

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

  String? _emailOutError(String email) {
    if (email.isEmpty) {
      return AppStrings.emailError;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return AppStrings.emailError2;
    }
    return null;
  }

  bool _emailIsValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _passwordIsValid(String password) {
    return password.length >= 6;
  }

  String? _passwordOutError(String password) {
    if (password.isEmpty) {
      return AppStrings.passwordError;
    } else if (password.length < 6) {
      return AppStrings.nameError2;
    }
    return null;
  }

  bool _areInputValid() {
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
  Stream<String?> get outEmailIsValid;

  Stream<String?> get outPasswordIsValid;

  Stream<bool> get outPasswordIsVisible;

  Stream<bool> get outAreAllInputValid;
}
