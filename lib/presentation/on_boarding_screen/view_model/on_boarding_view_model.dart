import 'dart:async';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';


class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onChangePage(int index) {
    _currentIndex =index;
    _postDataToView();
  }

  @override

  Sink get inputSliderViewObject => _streamController.sink;

  @override

  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // privat input function

  void _postDataToView() {
    _streamController.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle, ImageAssets.onBoardingLogo3),

  ];


}

abstract class OnBoardingViewModelInput {
  int goNext(); //when user swipe left
  int goPrevious(); //when user swipe right
  void onChangePage(int index);

// Stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
