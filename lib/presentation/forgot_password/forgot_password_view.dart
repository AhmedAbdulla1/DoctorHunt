import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_button.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_text_form_field.dart';
import 'package:doctor_hunt/presentation/forgot_password/forgot_password_view_mode.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgotPasswordView {

  final TextEditingController _emailController = TextEditingController();
  final ForgotPasswordViewModel _forgotPasswordViewModel =instance<ForgotPasswordViewModel>();

  showEmailBottomSheet(BuildContext context) {
    _forgotPasswordViewModel.start();
    _emailController.addListener(
          () => _forgotPasswordViewModel.setEmail(
        _emailController.text,
      ),
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
                  errorText: AppStrings.emailError,
                ),
              ),
              customElevatedButton(
                stream: _forgotPasswordViewModel.outEmail,
                onPressed: () {
                  _forgotPasswordViewModel.getOtp();
                  _showOtpBottomSheet(context);
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

  _showOtpBottomSheet(BuildContext context) {
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
                child: OtpTextField(
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  onCodeChanged: (String otp){
                    _forgotPasswordViewModel.setOtp(otp);
                  },
                  onSubmit: (String otp) {
                    _forgotPasswordViewModel.getOtp();
                    _forgotPasswordViewModel.outOtpCodeIsValid;
                  },
                ),
              ),
              customElevatedButton(
                stream: _forgotPasswordViewModel.outOtp,
                onPressed: () {},
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
                child: OtpTextField(
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  onSubmit: (String n) {

                    _forgotPasswordViewModel.outOtpCodeIsValid;
                  },
                ),
              ),
              customElevatedButton(
                stream: _forgotPasswordViewModel.outOtp,
                onPressed: () {},
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
}

