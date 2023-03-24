
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/data/network/app_api.dart';
import 'package:doctor_hunt/data/network/requests.dart';
import 'package:doctor_hunt/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<LoginAuthenticationResponse> loginResponse(
    LoginRequest loginRequest,
  );
  Future<SendEmailResponse> sendEmailResponse(String email);
  Future<AuthenticationResponse> registerResponse(
      RegisterRequest registerRequest,
      );
  Future<HomeResponse>homeResponse(String token);
  // Future<StoresDetailsResponse>storeDetailsResponse();

}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(
    this._appServicesClient,
  );

  @override
  Future<LoginAuthenticationResponse> loginResponse(
      LoginRequest loginRequest) async {
    return await _appServicesClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
  @override
  Future<AuthenticationResponse> registerResponse(RegisterRequest registerRequest)async {
    return await _appServicesClient.register(
      registerRequest.name,
      registerRequest.email,
      registerRequest.password,
    );
  }

  @override
  Future<SendEmailResponse> sendEmailResponse(String email) async{
    return await _appServicesClient.forgotPassword(
      email
    );
  }
  @override
  Future<HomeResponse> homeResponse(String token)async {
    return await _appServicesClient.home(
      Constant.token
    );
  }
  // @override
  // Future<StoresDetailsResponse> storeDetailsResponse()async {
  //   return await _appServicesClient.getStoreDetails();
  // }
}
