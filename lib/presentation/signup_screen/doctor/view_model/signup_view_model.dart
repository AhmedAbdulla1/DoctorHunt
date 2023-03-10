import 'dart:async';
import 'dart:io';

import 'package:doctor_hunt/domain/usecase/sign_as_doctor_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/freezed/freezed.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';

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


  // outputs

  @override
  Stream<String?> get outNameIsValid => _nameController.stream.map(
        (name) => _nameOutError(name),
      );
  @override
  Stream<String?> get outEmailIsValid => _emailController.stream.map(
        (email) => _emailOutError(email),
      );

  @override
  Stream<String?> get outPhone =>
      _phoneController.stream.map((phone) => _phoneOutError(phone));

  @override
  Stream<bool> get outPosition =>
      _positionController.stream.map((position) => _positionIsValid(position));

  @override
  Stream<File> get outGraduationCertificate =>
      _graduationCertificateController.stream.map((file) => file);

  @override
  Stream<File> get outProfilePicture =>
      _profilePictureController.stream.map((file) => file);

  @override
  Stream<String?> get outPasswordIsValid => _passwordController.stream.map(
        (password) => _passwordOutError(password),
      );
  @override
  Stream<bool> get outPasswordIsVisible =>
      _passwordVisibilityController.stream.map(
        (visibility) => visibility,
      );

  @override
  Stream<bool> get outAreInputValid =>
      _allInputsValid.stream.map((_) => _areInputsValid());


  String? _nameOutError(String name) {
    if(name.isEmpty){
      return AppStrings.nameError1;
    }
    else if(name.length<=6){
      return AppStrings.nameError2;
    }
    else{
      return null;
    }
  }
  _nameIsValid(String name) {
    return name.length>=6;
  }
  String? _emailOutError(String email){
    if (email.isEmpty) {
      return AppStrings.emailError;
    } else
    if( !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)){
      return AppStrings.emailError2;
    }
    return null;


  }
  _emailIsValid(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }


  _passwordIsValid(String password) {
    return password.length>=6;
  }
  String? _passwordOutError(String password) {
    if(password.isEmpty){
      return AppStrings.passwordError;
    }else if(password.length<6){
      return AppStrings.nameError2;
    }
    return null;
  }

  bool _areInputsValid() {
    return _nameIsValid(_registerAsADoctorObject.name) &&
        _emailIsValid(_registerAsADoctorObject.email) &&
        _passwordIsValid(_registerAsADoctorObject.password);
  }
  String? _phoneOutError(String phone){
    if(phone.isEmpty&&phone.length<10){
      return AppStrings.phoneError;
    }
    return null;
  }
  _phoneIsValid(String phone) {
    return phone.isNotEmpty;
  }

   _positionIsValid(String position) {
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
  Stream<String?> get outNameIsValid;

  Stream<String?> get outEmailIsValid;

  Stream<String?> get outPasswordIsValid;

  Stream<bool> get outPasswordIsVisible;

  Stream<String?> get outPhone;

  Stream<bool> get outPosition;

  Stream<File> get outGraduationCertificate;

  Stream<File> get outProfilePicture;

  Stream<bool> get outAreInputValid;
}
