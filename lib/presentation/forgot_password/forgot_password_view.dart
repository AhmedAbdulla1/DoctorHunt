import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_button.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_text_form_field.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/forgot_password/forgot_password_view_mode.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgotPasswordView {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ForgotPasswordViewModel _forgotPasswordViewModel =
      instance<ForgotPasswordViewModel>();
  bool visible = false;

  showEmailBottomSheet(BuildContext context) {
    _forgotPasswordViewModel.start();
    _emailController.addListener(
      () => _forgotPasswordViewModel.setEmail(
        _emailController.text,
      ),
    );
    _forgotPasswordViewModel.isUserSendEmailSuccessfullyStreamController.stream
        .listen(
      (isLogin) {
        if (isLogin) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            // _appPreferences.setPressKeyLoginScreen();
            _showOtpBottomSheet(context);
          });
        }
      },
    );
    showModalBottomSheet(
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppSize.s30,
          ),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StreamBuilder<StateFlow>(
          stream: _forgotPasswordViewModel.outputState,
          builder: (context, snapshot) =>
              snapshot.data?.getScreenWidget(
                context,
                _getContent(context),
                () {},
              ) ??
              _getContent(context),
        );
      },
    );
  }

  Widget _getContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPadding.p20,
        right: AppPadding.p20,
        left: AppPadding.p20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: AppSize.s130,
              height: AppSize.s5,
              decoration: BoxDecoration(
                color: ColorManager.grey,
                borderRadius: BorderRadius.circular(
                  AppSize.s10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p40,
              bottom: AppPadding.p12,
            ),
            child: Text(
              AppStrings.forgotPassword,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Text(
            AppStrings.enterYourEmailVerification,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p45,
              bottom: AppPadding.p30,
            ),
            child: customTextFormField(
              stream: _forgotPasswordViewModel.outEmail,
              textEditingController: _emailController,
              hintText: AppStrings.email,

            ),
          ),
          customElevatedButton(
            stream: _forgotPasswordViewModel.outEmailIsValid,
            onPressed: () {
              _forgotPasswordViewModel.sendEmail();
              // Navigator.pop(context);
            },
            text: AppStrings.Continue,
          ),
          const SizedBox(
            height: AppSize.s20,
          )
        ],
      ),
    );
  }








  _showOtpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s30),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p20,
            right: AppPadding.p20,
            left: AppPadding.p20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: AppSize.s130,
                  height: AppSize.s5,
                  decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(
                      AppSize.s10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p40,
                  bottom: AppPadding.p12,
                ),
                child: Text(
                  AppStrings.enter4Digits,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Text(
                AppStrings.enter4digitsSubTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p45,
                  bottom: AppPadding.p30,
                ),
                child: OtpTextField(
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  onCodeChanged: (String otp) {
                    _forgotPasswordViewModel.setOtp(otp);
                  },
                  // onSubmit: (String otp) {
                  //   Navigator.pop(context);
                  //   _showNewPasswordBottomSheet(context);
                  //   // _forgotPasswordViewModel.outOtpCodeIsValid;
                  // },
                ),
              ),
              customElevatedButton(
                stream: _forgotPasswordViewModel.outOtp,
                onPressed: () {
                  Navigator.pop(context);
                  _showNewPasswordBottomSheet(context);
                },
                text: AppStrings.Continue,
              ),
              const SizedBox(
                height: AppSize.s20,
              )
            ],
          ),
        );
      },
    );
  }

  _showNewPasswordBottomSheet(BuildContext context) {
    _newPasswordController.addListener(
      () => _forgotPasswordViewModel.setNewPassword(
        _newPasswordController.text,
      ),
    );
    _confirmPasswordController.addListener(
      () => _forgotPasswordViewModel.setConfirmPassword(
        _confirmPasswordController.text,
      ),
    );
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AppSize.s30))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: AppPadding.p20,
              right: AppPadding.p20,
              left: AppPadding.p20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: AppSize.s130,
                  height: AppSize.s5,
                  decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(
                      AppSize.s10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p40,
                  bottom: AppPadding.p12,
                ),
                child: Text(
                  AppStrings.resetPassword,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Text(
                AppStrings.enterNewPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p45,
                  bottom: AppPadding.p18,
                ),
                child: customPasswordFormField(
                  stream1: _forgotPasswordViewModel.outNewPassword,
                  stream2: _forgotPasswordViewModel.outVisibility,
                  textEditingController: _newPasswordController,
                  onPressed: () {
                    visible = !visible;
                    _forgotPasswordViewModel.setVisibility(visible);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppPadding.p30,
                ),
                child: customPasswordFormField(

                  stream1: _forgotPasswordViewModel.outNewPassword,
                  stream2: _forgotPasswordViewModel.outVisibility,
                  textEditingController: _confirmPasswordController,
                  onPressed: () {
                    visible = !visible;
                    _forgotPasswordViewModel.setVisibility(visible);
                  },
                ),
              ),
              customElevatedButton(
                stream: _forgotPasswordViewModel.outConfirmPassword,
                onPressed: () {
                  Navigator.pop(context);
                  _forgotPasswordViewModel.resetPassword();
                },
                text: AppStrings.updatePassword,
              ),
              const SizedBox(
                height: AppSize.s20,
              )
            ],
          ),
        );
      },
    );
  }
}
