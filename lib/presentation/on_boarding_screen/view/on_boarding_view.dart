import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_scaffold.dart';
import 'package:doctor_hunt/presentation/common/reusable/custom_button.dart';
import 'package:doctor_hunt/presentation/on_boarding_screen/view_model/on_boarding_view_model.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = instance<OnBoardingViewModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _appPreferences.setPressKeyOnBoardingScreen();
    _viewModel.start(); //tell view model start your jop
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return customScaffold(
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onChangePage(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
      );
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            _sliderObject.image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p50,
            vertical: AppPadding.p8,
          ),
          child: customElevatedButtonWithoutStream(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.registerScreen);
            },
            text: AppStrings.getStart,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          },
          child: Text(
            AppStrings.skip,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
