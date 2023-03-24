

import 'package:dio/dio.dart';
import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseurl,)
abstract class  AppServicesClient{
  factory AppServicesClient(Dio dio,{String baseUrl}) =_AppServicesClient;
  @POST("/users/login/")
  Future<LoginAuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );


  @POST("/users/sendemail/")
  Future<SendEmailResponse> forgotPassword(@Field("email") String email,);

  @POST("/users/register/")
  Future<AuthenticationResponse> register(
      @Field("username") String userName,
      @Field("email") String email,
      @Field("password") String password,
      );
  @GET("/main")
  Future<HomeResponse> home(
      @Field("Authorization") String authorization,
      );

  // @GET("/store_details")
  // Future<StoresDetailsResponse> getStoreDetails();

}

// body:
// email , password, username,image,phonenumber,databirth(mm/dd/yyyy),location