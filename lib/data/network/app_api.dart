
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseurl,)
abstract class  AppServicesClient{
  factory AppServicesClient(Dio dio,{String baseUrl}) =_AppServicesClient;
  @POST("/customers/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );
  // @POST("/customers/forgot_password")
  // Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email,);

  @POST("/customers/register")
  Future<AuthenticationResponse> register(
      @Field("userName") String userName,
      @Field("email") String email,
      @Field("password") String password,
      );
  // @GET("/home")
  // Future<HomeResponse> home();
  //
  // @GET("/store_details")
  // Future<StoresDetailsResponse> getStoreDetails();

}