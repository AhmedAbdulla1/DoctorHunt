import 'dart:io';

import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_button.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_scaffold.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_text_form_field.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:doctor_hunt/presentation/signup_screen/doctor/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterAsDoctorView extends StatefulWidget {
  const RegisterAsDoctorView({Key? key}) : super(key: key);

  @override
  State<RegisterAsDoctorView> createState() => _RegisterAsDoctorViewState();
}

class _RegisterAsDoctorViewState extends State<RegisterAsDoctorView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final RegisterAsDoctorViewModel _registerAsDoctorViewModel =
      instance<RegisterAsDoctorViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController=TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  final GlobalKey _globalKey = GlobalKey<FormState>();
  bool visible = true;

  void _bind() {
    // _appPreferences.setPressKeySignupScreen();
    _registerAsDoctorViewModel.start();
    _nameController.addListener(
      () => _registerAsDoctorViewModel.setName(
        _nameController.text,
      ),
    );
    _emailController.addListener(
      () => _registerAsDoctorViewModel.setEmail(
        _emailController.text,
      ),
    );
    _passwordController.addListener(
      () => _registerAsDoctorViewModel.setPassword(
        _passwordController.text,
      ),
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      // backgroundColor: ColorManager.white,
      body: StreamBuilder<StateFlow>(
        stream: _registerAsDoctorViewModel.outputState,
        builder: (context, snapshot) =>
            snapshot.data?.getScreenWidget(
              context,
              _getContent(),
              () {},
            ) ??
            _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return SizedBox(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: StreamBuilder<File>(
                          stream: _registerAsDoctorViewModel.outProfilePicture,
                          builder: (context, snapshot) {
                            return _personPicketByUser(snapshot.data);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s18,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: StreamBuilder<File>(
                          stream: _registerAsDoctorViewModel.outProfilePicture,
                          builder: (context, snapshot) {
                            return _gradPicketByUser(snapshot.data);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  customTextFormField(
                    stream: _registerAsDoctorViewModel.outNameIsValid,
                    textEditingController: _nameController,
                    textInputType: TextInputType.name,
                    hintText: AppStrings.name,
                    errorText: AppStrings.nameError,
                  ),
                  const SizedBox(height: AppSize.s14),
                  customTextFormField(
                    stream: _registerAsDoctorViewModel.outEmailIsValid,
                    textEditingController: _emailController,
                    hintText: AppStrings.email,
                    errorText: AppStrings.emailError,
                  ),
                  const SizedBox(height: AppSize.s14),
                  customPasswordFormField(
                    stream1: _registerAsDoctorViewModel.outPasswordIsValid,
                    stream2: _registerAsDoctorViewModel.outPasswordIsVisible,
                    textEditingController: _passwordController,
                    onPressed: () {
                      visible = !visible;
                      _registerAsDoctorViewModel.setVisibility(visible);
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            // width: double.infinity,
                            height: AppSize.s55,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.grey,
                                  blurRadius: 5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                AppSize.s12,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppStrings.addProfilePicture,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: AppSize.s55,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.grey1,
                                  blurRadius: 5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                AppSize.s12,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppStrings.addProfilePicture,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s14),
                  customTextFormField(
                    stream: _registerAsDoctorViewModel.outPhone,
                    textEditingController: _nameController,
                    textInputType: TextInputType.phone,
                    hintText: AppStrings.phone,
                    errorText: AppStrings.phoneError,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: false,
                          onChanged: (value) {}),
                      Text(AppStrings.privacy,
                          style: Theme.of(context).textTheme.labelSmall)
                    ],
                  ),
                  const SizedBox(height: AppSize.s50),
                  customElevatedButton(
                    stream: _registerAsDoctorViewModel.outAreInputValid,
                    onPressed: () {
                      // _signUpViewModel.signup();
                      Navigator.pushNamed(context, Routes.mainScreen);
                    },
                    text: AppStrings.signup,
                  ),
                  textButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                    text: AppStrings.haveAccount,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: const Text(AppStrings.photoGallery),
                onTap: () {
                  _imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(AppStrings.photoCamera),
                onTap: () {
                  _imageFromCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _registerAsDoctorViewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _registerAsDoctorViewModel.setProfilePicture(File(image?.path ?? ""));
  }

  Widget _personPicketByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      // return image
      return Image.file(image);
    } else {
      return Image.asset(
        ImageAssets.personal,
      );
    }
  }

  Widget _gradPicketByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      // return image
      return Image.file(image);
    } else {
      return Image.asset(
        ImageAssets.grad,
      );
    }
  }
}
