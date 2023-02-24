import 'dart:async';

import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_scaffold.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/constant.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;

  _startTimer() {
    _timer = Timer(
      const Duration(
        seconds: AppConstant.timer,
      ),
      () async {
        if (await _appPreferences.isPressKeyLoginScreen()) {
          Navigator.pushReplacementNamed(context, Routes.registerScreen);
        } else if (await _appPreferences.isPressKeyOnBoardingScreen()) {
          Navigator.pushReplacementNamed(context, Routes.registerScreen);
        } else {
          Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.splashLogo),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.splash,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
