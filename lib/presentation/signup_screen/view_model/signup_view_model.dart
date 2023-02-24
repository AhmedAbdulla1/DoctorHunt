import 'dart:async';

import 'package:doctor_hunt/domain/usecase/register_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';

class SignUpViewModel extends BaseViewModel
    with SignUpViewModelInput, SignUpViewModelOutput {
  final StreamController _nameController = StreamController<String>.broadcast();
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  final StreamController _passwordVisibilityController =
      StreamController<bool>.broadcast();
  final StreamController<void> _allInputsValid = StreamController.broadcast();
  SignupObject _signupObject = SignupObject("", "", "");
  final RegisterUseCase _registerUseCase;

  SignUpViewModel(this._registerUseCase);

  @override
  void start() {
    //مش مستني تحميل حاجة خارجية ف هبني الواجهة علطول
    inputState.add(ContentState());
  }

  @override
  signup() {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.popupLoadingState,
      ),
    );
    return;
    _registerUseCase.execute(RegisterUseCaseInput(
      name: _signupObject.name,
      email: _signupObject.email,
      password: _signupObject.password,
    ));
  }

  @override
  setName(String name) {
    _nameController.add(name);
    if (_nameIsValid(name)) {
      _signupObject = _signupObject.copyWith(
        name: name,
      );
    } else {
      _signupObject = _signupObject.copyWith(name: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    print(email);
    _emailController.add(email);
    if (_emailIsValid(email)) {
      _signupObject = _signupObject.copyWith(
        email: email,
      );
    } else {
      _signupObject = _signupObject.copyWith(email: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    _passwordController.add(password);
    if (_passwordIsValid(password)) {
      _signupObject = _signupObject.copyWith(
        password: password,
      );
    } else {
      _signupObject = _signupObject.copyWith(password: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setVisibility(bool visible) {
    _passwordVisibilityController.add(visible);
  }

  @override
  void dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _passwordVisibilityController.close();
    super.dispose();
  }

  @override
  Sink get inputNameIsValid => _nameController.sink;

  @override
  Sink get inputEmailIsValid => _emailController.sink;

  @override
  Sink get inputPasswordIsValid => _passwordController.sink;

  @override
  Sink get inputPasswordIsVisible => _passwordVisibilityController.sink;

  @override
  Stream<bool> get outNameIsValid => _nameController.stream.map(
        (name) => _nameIsValid(name),
      );

  @override
  Stream<bool> get outEmailIsValid => _emailController.stream.map(
        (email) => _emailIsValid(email),
      );

  @override
  Stream<bool> get outPasswordIsValid => _passwordController.stream.map(
        (password) => _passwordIsValid(password),
      );

  @override
  Stream<bool> get outPasswordIsVisible =>
      _passwordVisibilityController.stream.map(
        (visibility) => visibility,
      );

  _nameIsValid(String name) {
    return name.isNotEmpty;
  }

  _emailIsValid(String email) {
    return email.isNotEmpty;
  }

  _passwordIsValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Sink get inputAreInputsValid => _allInputsValid.sink;

  @override
  Stream<bool> get outAreInputValid =>
      _allInputsValid.stream.map((_) => _areInputsValid());

  bool _areInputsValid() {
    return _nameIsValid(_signupObject.name) &&
        _emailIsValid(_signupObject.email) &&
        _passwordIsValid(_signupObject.password);
  }
}

abstract class SignUpViewModelInput {
  setName(String name);

  setEmail(String email);

  setPassword(String password);

  setVisibility(bool visible);

  signup();

  Sink get inputNameIsValid;

  Sink get inputEmailIsValid;

  Sink get inputPasswordIsValid;

  Sink get inputPasswordIsVisible;

  Sink get inputAreInputsValid;
}

abstract class SignUpViewModelOutput {
  Stream<bool> get outNameIsValid;

  Stream<bool> get outEmailIsValid;

  Stream<bool> get outPasswordIsValid;

  Stream<bool> get outPasswordIsVisible;

  Stream<bool> get outAreInputValid;
}
