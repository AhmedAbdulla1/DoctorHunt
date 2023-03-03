import 'dart:async';

import 'package:doctor_hunt/domain/usecase/forgot_password_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';

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
  ForgotPasswordObject _forgotPasswordObject = ForgotPasswordObject('');

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  @override
  void start() {
    inputState.add(ContentState());
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
        SuccessState(data),
      );
      // isUserForgotPasswordSuccessfullyStreamController.add(true);
    });
  }

  @override
  getOtp() async {
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
        SuccessState(data),
      );
      // isUserForgotPasswordSuccessfullyStreamController.add(true);
    });
  }

  @override
  setOtp(String otp) {
    inputOtp.add(otp);
  }

  @override
  setNewPassword(String password) {
    inputNewPassword.add(password);
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
  Stream<bool> get outEmail =>
      _emailController.stream.map((email) => _emailIsValid(email));

  @override
  Stream<bool> get outOtp =>
      _otpController.stream.map((otp) => _otpIsValid(otp));

  @override
  Stream<bool> get outOtpCodeIsValid =>
      _otpCodeIsValidController.stream.map((otp) => _otpIsConfirm(otp));

  @override
  Stream<bool> get outNewPassword => _newPasswordController.stream
      .map((password) => _newPasswordIsValid(password));

  @override
  Stream<bool> get outConfirmPassword => _confirmPasswordController.stream
      .map((confirm) => _confirmPasswordIsValid(confirm));

  _emailIsValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  _otpIsValid(String otp) {
    return otp.isNotEmpty;
  }

  _otpIsConfirm(String otp) {
    // todo confirm otp
    return otp.isNotEmpty;
  }

  _newPasswordIsValid(String password) {
    return password.length >= 6;
  }

  _confirmPasswordIsValid(String confirm) {
    // TODO: implement outConfirmPassword
    return confirm.length >= 6;
  }
}

abstract class ForgotPasswordViewModelInput {
  setEmail(String email);

  getOtp();

  setOtp(String otp);

  sendEmail();

  setNewPassword(String password);

  setConfirmPassword(String confirm);

  Sink get inputEmail;

  Sink get inputOtp;

  Sink get inputNewPassword;

  Sink get inputConfirmPassword;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outEmail;

  Stream<bool> get outOtp;

  Stream<bool> get outNewPassword;

  Stream<bool> get outConfirmPassword;

  Stream<bool> get outOtpCodeIsValid;
}
