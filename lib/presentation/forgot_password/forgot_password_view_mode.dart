import 'dart:async';

import 'package:doctor_hunt/domain/usecase/forgot_password_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController<String> _emailController =
      StreamController.broadcast();
  final StreamController<String> _otpController = StreamController.broadcast();
  final StreamController<String> _newPasswordController =
      StreamController.broadcast();
  final StreamController<String> _confirmPasswordController =
      StreamController.broadcast();
  final StreamController<String> _otpCodeIsValidController =
      StreamController.broadcast();
  final StreamController<bool> _visibilityController =
      StreamController.broadcast();
  final StreamController<bool> isUserSendEmailSuccessfullyStreamController =
      StreamController.broadcast();

  final StreamController<void> _allInputsValid = StreamController.broadcast();
  ForgotPasswordObject _forgotPasswordObject = ForgotPasswordObject('', '', '');

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _emailController.close();
    _otpController.close();
    _newPasswordController.close();
    _confirmPasswordController.close();
    _otpCodeIsValidController.close();
    _visibilityController.close();
    super.dispose();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    _forgotPasswordObject = _forgotPasswordObject.copyWith(email: email);
  }

  @override
  sendEmail() async {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.popupLoadingState,
      ),
    );
    (await _forgotPasswordUseCase.execute(
      _forgotPasswordObject.email,
    ))
        .fold((failure) {
          print(failure.message);
      inputState.add(ErrorState(
        stateRenderType: StateRenderType.popupErrorState,
        message: failure.message,
      ));
    }, (data) {
          print(data);
      inputState.add(
        SuccessState(data.detail),
      );
      isUserSendEmailSuccessfullyStreamController.add(true);
    });
  }

  @override
  resetPassword() async {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState,
      ),
    );
    (await _forgotPasswordUseCase.execute(
      _forgotPasswordObject.email,
    ))
        .fold((failure) {
      inputState.add(ErrorState(
        stateRenderType: StateRenderType.fullScreenErrorState,
        message: failure.message,
      ));
    }, (data) {
      // print(data);
      inputState.add(
        SuccessState(data.detail),
      );
      // isUserForgotPasswordSuccessfullyStreamController.add(true);
    });
  }

  @override
  setOtp(String otp) {
    inputOtp.add(otp);
    _forgotPasswordObject = _forgotPasswordObject.copyWith(otp: otp);
  }

  @override
  setNewPassword(String password) {
    inputNewPassword.add(password);
    _forgotPasswordObject = _forgotPasswordObject.copyWith(
      password: password,
    );
  }

  @override
  setConfirmPassword(String confirm) {
    inputConfirmPassword.add(confirm);
  }

  @override
  Sink get inputEmail => _emailController.sink;

  @override
  Sink get inputOtp => _otpController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordController.sink;

  @override
  Sink get inputNewPassword => _newPasswordController.sink;

  @override
  Stream<String?> get outEmail =>
      _emailController.stream.map((email) => _emailOutError(email));

  @override
  Stream<bool> get outOtp =>
      _otpController.stream.map((otp) => _otpIsValid(otp));

  @override
  Stream<bool> get outOtpCodeIsValid =>
      _otpCodeIsValidController.stream.map((otp) => _otpIsConfirm(otp));

  @override
  Stream<String?> get outNewPassword => _newPasswordController.stream
      .map((password) => _passwordOutError(password));

  @override
  Stream<bool> get outConfirmPassword => _confirmPasswordController.stream
      .map((confirm) => _confirmPasswordIsValid(confirm));

  String? _emailOutError(String email) {
    if (email.isEmpty) {
      return AppStrings.emailError;
    }
    if (!RegExp(
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

  _otpIsValid(String otp) {
    //todo
  }

  _otpIsConfirm(String otp) {
    return otp.length == 4;
  }

  _newPasswordIsValid(String password) {
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

  _confirmPasswordIsValid(String confirm) {
    return confirm.length >= 6 && confirm == _forgotPasswordObject.password;
  }

  @override
  Sink get inputVisibility => _visibilityController.sink;

  @override
  Stream<bool> get outVisibility =>
      _visibilityController.stream.map((visible) => visible);

  @override
  setVisibility(bool visible) {
    inputVisibility.add(visible);
  }

  @override
  Stream<bool> get outEmailIsValid =>
      _emailController.stream.map((email) => _emailIsValid(email));
}

abstract class ForgotPasswordViewModelInput {
  setEmail(String email);

  resetPassword();

  setOtp(String otp);

  sendEmail();

  setNewPassword(String password);

  setConfirmPassword(String confirm);

  setVisibility(bool visible);

  Sink get inputEmail;

  Sink get inputOtp;

  Sink get inputNewPassword;

  Sink get inputConfirmPassword;

  Sink get inputVisibility;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<String?> get outEmail;

  Stream<bool> get outEmailIsValid;

  Stream<bool> get outOtp;

  Stream<String?> get outNewPassword;

  Stream<bool> get outConfirmPassword;

  Stream<bool> get outOtpCodeIsValid;

  Stream<bool> get outVisibility;
}
