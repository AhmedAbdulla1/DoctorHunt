import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_button.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_scaffold.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_text_form_field.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/login_screen/view_model/login_view_model.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _globalKey = GlobalKey<FormState>();
  bool visible = true;

  void _bind() {
    // _appPreferences.setPressKeySignupScreen();
    _loginViewModel.start();
    _emailController.addListener(
      () => _loginViewModel.setEmail(
        _emailController.text,
      ),
    );
    _passwordController.addListener(
      () => _loginViewModel.setPassword(
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
      body: StreamBuilder<StateFlow>(
        stream: _loginViewModel.outputState,
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
                  Text(
                    AppStrings.loginTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p40,
                      right: AppPadding.p40,
                      top: AppPadding.p14,
                      bottom: AppPadding.p65,
                    ),
                    child: Text(
                      AppStrings.loginSubTitle,
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
                                color: ColorManager.grey,
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
                                color: ColorManager.grey1,
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
                    stream: _loginViewModel.outEmailIsValid,
                    textEditingController: _emailController,
                    hintText: AppStrings.email,
                    errorText: AppStrings.emailError,
                  ),
                  const SizedBox(height: AppSize.s14),
                  customPasswordFormField(
                    stream1: _loginViewModel.outPasswordIsValid,
                    stream2: _loginViewModel.outPasswordIsVisible,
                    textEditingController: _passwordController,
                    onPressed: () {
                      visible = !visible;
                      _loginViewModel.setVisibility(visible);
                    },
                  ),
                  const SizedBox(height: AppSize.s50),
                  customElevatedButton(
                    stream: _loginViewModel.outAreAllInputValid,
                    onPressed: () {
                      // _LoginViewModel.signup();
                      Navigator.pushNamed(context, Routes.mainScreen);
                    },
                    text: AppStrings.login,
                  ),
                  textButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                    },
                    text: AppStrings.forgetPassword,
                  ),
                  const SizedBox(height: AppSize.s100,),
                  textButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerScreen);
                    },
                    text: AppStrings.dontHaveAnAccount,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
