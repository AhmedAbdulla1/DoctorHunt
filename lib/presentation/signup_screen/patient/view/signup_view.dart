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
import 'package:doctor_hunt/presentation/signup_screen/patient/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final SignUpViewModel _signUpViewModel = instance<SignUpViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _globalKey = GlobalKey<FormState>();
  bool visible = true;

  void _bind() {
    // _appPreferences.setPressKeySignupScreen();
    _signUpViewModel.start();
    _nameController.addListener(
      () => _signUpViewModel.setName(
        _nameController.text,
      ),
    );
    _emailController.addListener(
      () => _signUpViewModel.setEmail(
        _emailController.text,
      ),
    );
    _passwordController.addListener(
      () => _signUpViewModel.setPassword(
        _passwordController.text,
      ),
    );
    _signUpViewModel.isUserRegisterSuccessfullyStreamController.stream
        .listen((isLoading) {
      if (isLoading) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
         // _appPreferences.setPressKeyLoginScreen();
          Navigator.pushReplacementNamed(context, Routes.mainScreen);
        });
      }
    });
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
        stream: _signUpViewModel.outputState,
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
                  const SizedBox(height: AppSize.s30,),
                  Text(
                    AppStrings.signupTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p40,
                        right: AppPadding.p40,
                        top: AppPadding.p14,
                        bottom: AppPadding.p65),
                    child: Text(
                      AppStrings.signupSubTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: double.infinity,
                          height: AppSize.s55,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.lightGrey.withOpacity(0.50),
                                blurRadius: 5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                              AppSize.s12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageAssets.google,
                              ),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              Text(
                                AppStrings.google,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s14,
                      ),
                      Expanded(
                        child: Container(
                          height: AppSize.s55,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            boxShadow: [
                              BoxShadow(
                                color:ColorManager.lightGrey.withOpacity(0.50),
                                blurRadius: 5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                              AppSize.s12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageAssets.facebook,
                              ),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              Text(
                                AppStrings.facebook,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s35,
                  ),
                  customTextFormField(
                    stream: _signUpViewModel.outNameIsValid,
                    textEditingController: _nameController,
                    textInputType: TextInputType.name,
                    hintText: AppStrings.name,

                  ),
                  const SizedBox(height: AppSize.s14),
                  customTextFormField(
                    stream: _signUpViewModel.outEmailIsValid,
                    textEditingController: _emailController,
                    hintText: AppStrings.email,
                  ),
                  const SizedBox(height: AppSize.s14),
                  customPasswordFormField(
                    stream1: _signUpViewModel.outPasswordIsValid,
                    stream2: _signUpViewModel.outPasswordIsVisible,
                    textEditingController: _passwordController,
                    onPressed: () {
                      visible = !visible;
                      _signUpViewModel.setVisibility(visible);
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.grey.withOpacity(0.5),
                        radius: 8,
                      ),
                      // Radio(
                      //     value: false,
                      //     groupValue: false,
                      //     onChanged: (value) {}),
                      Text(AppStrings.privacy,
                          style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s50),
                  customElevatedButton(
                    stream: _signUpViewModel.outAreInputValid,
                    onPressed: () {
                      _signUpViewModel.signup();
                    },
                    text: AppStrings.signup,
                  ),
                  textButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginScreen,
                      );
                    },
                    text: AppStrings.haveAccount,
                  ),
                  Text(
                    AppStrings.doctor,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  textButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.registerAsDoctorScreen,
                      );
                    },
                    text: AppStrings.registerAsADoctor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
