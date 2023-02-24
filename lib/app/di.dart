import 'package:dio/dio.dart';
import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/data/data_source/remote_data_source.dart';
import 'package:doctor_hunt/data/network/app_api.dart';
import 'package:doctor_hunt/data/network/dio_factory.dart';
import 'package:doctor_hunt/data/network/network_info.dart';
import 'package:doctor_hunt/data/repository/repository_impl.dart';
import 'package:doctor_hunt/domain/repository/repository.dart';
import 'package:doctor_hunt/domain/usecase/login_usecase.dart';
import 'package:doctor_hunt/domain/usecase/register_usecase.dart';
import 'package:doctor_hunt/presentation/login_screen/view_model/login_view_model.dart';
import 'package:doctor_hunt/presentation/on_boarding_screen/view_model/on_boarding_view_model.dart';
import 'package:doctor_hunt/presentation/signup_screen/view_model/signup_view_model.dart';
import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';


import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
final instance = GetIt.instance;

Future<void> initAppModule() async {
  final shardPref = await SharedPreferences.getInstance();
  // instance for shared pref
  instance.registerLazySingleton(() => shardPref);
  // instant for AppPreferences
  instance.registerLazySingleton(
    () => AppPreferences(
      instance<SharedPreferences>(),
    ),
  );

  // instant for network info
  instance.registerLazySingleton<NetWorkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  // instant for dioFactory
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(
      instance<AppPreferences>(),
    ),
  );

  //instant for AppServicesClient
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServicesClient>(
    () => AppServicesClient(
      dio,
    ),
  );
//
  // instant for remoteDataSource
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      instance<AppServicesClient>(),
    ),
  );
//   // instance for local data source
//   instance.registerLazySingleton<LocalDataSource>(
//     () => LocalDataSourceImpl(),
//   );
//   //instant for repository

  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      // instance<LocalDataSource>(),
      instance<RemoteDataSource>(),
      instance<NetWorkInfo>(),
    ),
  );
}

initOnBoardingModule() {
  if (!GetIt.I.isRegistered<OnBoardingViewModel>()) {
    instance.registerFactory<OnBoardingViewModel>(() => OnBoardingViewModel());
  }
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
    instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance<LoginUseCase>()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(instance<Repository>()));
    instance.registerFactory<SignUpViewModel>(
        () => SignUpViewModel(instance<RegisterUseCase>()));
    // if (!GetIt.I.isRegistered<ImagePicker>()) {
    //   instance.registerFactory<ImagePicker>(() => ImagePicker());
    // }
  }
}
// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance<Repository>()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance<ForgotPasswordUseCase>()));
//   }
// }
//
// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(
//         () => HomeUseCase(instance<Repository>()));
//     instance.registerFactory<HomeViewModel>(
//         () => HomeViewModel(instance<HomeUseCase>()));
//   }
// }
// // initStoreDetailsModule() {
// //   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
// //     instance.registerFactory<StoreDetailsUseCase>(
// //             () => StoreDetailsUseCase(instance<Repository>()));
// //     instance.registerFactory<StoreViewModel>(
// //             () => StoreViewModel(instance<StoreDetailsUseCase>()));
// //   }

