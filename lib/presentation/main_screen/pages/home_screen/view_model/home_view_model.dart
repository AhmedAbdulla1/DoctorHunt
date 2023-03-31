import 'dart:async';
import 'dart:ffi';

import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/domain/usecase/home_usecase.dart';
import 'package:doctor_hunt/presentation/base/base_view_model.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final  _dataStreamController =
  BehaviorSubject<HomeViewObject>();
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  // --  inputs
  @override
  void start()  {
    // debugPrint('start2');
     _getHomeData();
  }

  _getHomeData() async {
    inputState.add(

      LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState,
      ),
    );
    debugPrint('loading');
    (await _homeUseCase.execute(Void)).fold(
            (failure) {
                  // left -> failure
                  inputState.add(
                    ErrorState(
                      stateRenderType: StateRenderType.fullScreenErrorState,
                      message: failure.message,
                    ),
                  );
                }, (home) {
      // right -> data (success)
      debugPrint('home');
      inputHomeData.add(HomeViewObject(
        home.userData!,
        home.liveDoctors!,
        home.popularDoctors!,
        home.featureDoctors!,
      ));
      inputState.add(ContentState());
      // navigate to main screen
    });
    debugPrint('end');

  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  UserData userData;
  List<LiveDoctors> liveDoctors;
  List<PopularDoctors> popularDoctor;
  List<FeatureDoctors> featureDoctor;

  HomeViewObject(
    this.userData,
    this.liveDoctors,
    this.popularDoctor,
    this.featureDoctor,
  );
}
