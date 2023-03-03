import 'dart:async';
import 'dart:io';

import 'package:doctor_hunt/domain/usecase/sign_as_adoctor_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';

class RegisterAsDoctorViewModel extends BaseViewModel
    with RegisterAsDoctorViewModelInput, RegisterAsDoctorViewModelOutput {
  final StreamController _nameController = StreamController<String>.broadcast();
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  final StreamController _passwordVisibilityController =
      StreamController<bool>.broadcast();
  final StreamController _phoneController =
      StreamController<String>.broadcast();
  final StreamController _positionController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureController =
      StreamController<File>.broadcast();
  final StreamController _graduationCertificateController =
      StreamController<File>.broadcast();

  final StreamController<void> _allInputsValid = StreamController.broadcast();
  RegisterAsADoctorObject _registerAsADoctorObject =
      RegisterAsADoctorObject("", "", "", "", "", null, null);
  final SignAsDoctorUseCase _registerUseCase;

  RegisterAsDoctorViewModel(this._registerUseCase);

  @override
  void start() {
    //مش مستني تحميل حاجة خارجية ف هبني الواجهة علطول
    inputState.add(ContentState());
  }

  @override
  register() {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.popupLoadingState,
      ),
    );
    return;
    // _registerUseCase.execute(RegisterUseCaseInput(
    //   name: _signupObject.name,
    //   email: _signupObject.email,
    //   password: _signupObject.password,
    // ));
  }

  @override
  setName(String name) {
    _nameController.add(name);
    if (_nameIsValid(name)) {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        name: name,
      );
    } else {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(name: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    // print(email);
    _emailController.add(email);
    if (_emailIsValid(email)) {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        email: email,
      );
    } else {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(email: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    _passwordController.add(password);
    if (_passwordIsValid(password)) {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        password: password,
      );
    } else {
      _registerAsADoctorObject =
          _registerAsADoctorObject.copyWith(password: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setVisibility(bool visible) {
    _passwordVisibilityController.add(visible);
  }

  @override
  setPhone(String phone) {
    _phoneController.add(phone);
    if (_passwordIsValid(phone)) {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        phone: phone,
      );
    } else {
      _registerAsADoctorObject =
          _registerAsADoctorObject.copyWith(phone: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setPosition(String position) {
    _positionController.add(position);
    if (_passwordIsValid(position)) {
      _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        position: position,
      );
    } else {
      _registerAsADoctorObject =
          _registerAsADoctorObject.copyWith(position: '');
    }
    _allInputsValid.add(null);
  }

  @override
  setProfilePicture(File profilePicture) {
    _profilePictureController.add(profilePicture);
    _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        profilePicture: profilePicture);
    _allInputsValid.add(null);
  }

  @override
  setGraduationCertificate(File graduationCertificate) {
    _graduationCertificateController.add(graduationCertificate);
    _registerAsADoctorObject = _registerAsADoctorObject.copyWith(
        graduationCertificate: graduationCertificate);
    _allInputsValid.add(null);
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
  Sink get inputGraduationCertificate => _graduationCertificateController.sink;

  @override
  Sink get inputPhone => _phoneController.sink;

  @override
  Sink get inputPosition => _positionController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureController.sink;

  @override
  Sink get inputAreInputsValid => _allInputsValid.sink;

  @override
  Stream<File> get outGraduationCertificate =>
      _graduationCertificateController.stream.map((file) => file);

  @override
  Stream<bool> get outPhone =>
      _phoneController.stream.map((phone) => _phoneIsValid(phone));

  @override
  Stream<bool> get outPosition =>
      _positionController.stream.map((position) => _positionIsValid(position));

  @override
  Stream<File> get outProfilePicture =>
      _profilePictureController.stream.map((file) => file);

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

  @override
  Stream<bool> get outAreInputValid =>
      _allInputsValid.stream.map((_) => _areInputsValid());

  _nameIsValid(String name) {
    return name.isNotEmpty;
  }

  _emailIsValid(String email) {
    return email.isNotEmpty;
  }

  _passwordIsValid(String password) {
    return password.isNotEmpty;
  }


  bool _areInputsValid() {
    return _nameIsValid(_registerAsADoctorObject.name) &&
        _emailIsValid(_registerAsADoctorObject.email) &&
        _passwordIsValid(_registerAsADoctorObject.password);
  }

  bool _phoneIsValid(String phone) {
    return phone.isNotEmpty;
  }

  bool _positionIsValid(String position) {
    return position.isNotEmpty;
  }
}

abstract class RegisterAsDoctorViewModelInput {
  setName(String name);

  setEmail(String email);

  setPassword(String password);

  setVisibility(bool visible);

  setPosition(String position);

  setPhone(String phone);

  setProfilePicture(File profilePicture);

  setGraduationCertificate(File graduationCertificate);

  register();

  Sink get inputNameIsValid;

  Sink get inputEmailIsValid;

  Sink get inputPasswordIsValid;

  Sink get inputPasswordIsVisible;

  Sink get inputPhone;

  Sink get inputPosition;

  Sink get inputGraduationCertificate;

  Sink get inputProfilePicture;

  Sink get inputAreInputsValid;
}

abstract class RegisterAsDoctorViewModelOutput {
  Stream<bool> get outNameIsValid;

  Stream<bool> get outEmailIsValid;

  Stream<bool> get outPasswordIsValid;

  Stream<bool> get outPasswordIsVisible;

  Stream<bool> get outPhone;

  Stream<bool> get outPosition;

  Stream<File> get outGraduationCertificate;

  Stream<File> get outProfilePicture;

  Stream<bool> get outAreInputValid;
}
