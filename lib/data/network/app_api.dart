
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseurl,)
abstract class  AppServicesClient{
  factory AppServicesClient(Dio dio,{String baseUrl}) =_AppServicesClient;
  @POST("/users/login/")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );


  @POST("/users/sendemail/")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email,);

  @POST("/users/register/")
  Future<AuthenticationResponse> register(
      @Field("username") String userName,
      @Field("email") String email,
      @Field("password") String password,
      // @Field("phone_number") String phoneNumber,
      // @Part(value:"image",name: null ,contentType:  null,fileName:  null) File image,
      // @Field("location") String location,
      // @Field("date_birth") String dateBirth,
      );
  // @GET("/home")
  // Future<HomeResponse> home();
  //
  // @GET("/store_details")
  // Future<StoresDetailsResponse> getStoreDetails();

}

// body:
// email , password, username,image,phonenumber,databirth(mm/dd/yyyy),location