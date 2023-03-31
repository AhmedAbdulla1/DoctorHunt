
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/forgot_password/forgot_password_view.dart';
import 'package:doctor_hunt/presentation/login_screen/view/login_view.dart';
import 'package:doctor_hunt/presentation/main_screen/main_view.dart';
import 'package:doctor_hunt/presentation/on_boarding_screen/view/on_boarding_view.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:doctor_hunt/presentation/resources/style_manager.dart';
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
          initHomeModule();
          return  const MainView();
        });
      // case Routes.settingScreen:
      //   return MaterialPageRoute(builder: (_) => const SettingView());
      // case Routes.storeDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }
  List<String> liveDoctor=[];
  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),

          separatorBuilder: (context, index) => const SizedBox(
              height: 140,
            ),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              width: 115,
              height: 170,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s6),
                boxShadow: [BoxShadow(
                  color: ColorManager.lightGrey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(1, 2),
                ),],
              ),
              child: Stack(
                children: [
                  Image.network(
                    ImageAssets.personal,
                    width: 115,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: AppSize.s10,
                    right: AppSize.s10,
                    child: Container(
                      width: AppSize.s40,
                      height: AppSize.s18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s4),
                        color: ColorManager.error,

                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: AppSize.s1_5),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius:
                                  BorderRadius.circular(AppSize.s5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s1_5,
                            ),
                            Text(
                              "live",
                              style: getMediumStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
