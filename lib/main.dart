import 'package:doctor_hunt/app/app.dart';
import 'package:doctor_hunt/app/di.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}