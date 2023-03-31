import 'package:doctor_hunt/app/app_prefs.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
final AppPreferences _appPreferences = instance<AppPreferences>();
class Constant{
  static const String baseurl="https://doctorhunt.pythonanywhere.com/";
  static const String empty ="";
  static String token =_appPreferences.getToken();
  static const  int zero  =0;
  static const  int timeout  =60000;//this time by ms
  static const String image =ImageAssets.personal;
}