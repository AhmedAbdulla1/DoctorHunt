
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/forgot_password/forgot_password_view.dart';
import 'package:doctor_hunt/presentation/login_screen/view/login_view.dart';
import 'package:doctor_hunt/presentation/main_screen/main_view.dart';
import 'package:doctor_hunt/presentation/on_boarding_screen/view/on_boarding_view.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:doctor_hunt/presentation/signup_screen/doctor/view/signup_view.dart';
import 'package:doctor_hunt/presentation/signup_screen/patient/view/signup_view.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/onBoarding";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String registerAsDoctorScreen = "/registerAsDoctor";
  static const String forgotPasswordScreen = "/forgetPassword";
  static const String mainScreen = "/main";
  static const String storeDetailsScreen = "/storeDetails";
  static const String settingScreen = "/setting";
}
//
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) {
          initOnBoardingModule();
          return const OnBoardingView();
        });
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) {
            initLoginModule();
            initForgotPasswordModule();
            return  const LoginView();
          },
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) {
            initRegisterModule();
            return const SignupView();
          },
        );
      case Routes.registerAsDoctorScreen:
        return MaterialPageRoute(
          builder: (_) {
            initRegisterAsDoctorNodule();
            return const RegisterAsDoctorView();
          },
        );
      // case Routes.forgotPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) {
      //
      //       return const ForgotPasswordView();
      //     },
      //   );
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) {
          // initHomeModule();
          return  MainView();
        });
      // case Routes.settingScreen:
      //   return MaterialPageRoute(builder: (_) => const SettingView());
      // case Routes.storeDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body:  Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorManager.grey,
                  style: BorderStyle.solid,
                  width: AppSize.s1_5,
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}
