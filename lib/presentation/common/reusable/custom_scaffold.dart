import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

Widget customScaffold({
  required Widget body,
}) {
  return Scaffold(
    body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.backGround),
          fit: BoxFit.fill,
        ),
      ),
      child: body,
    ),
  );
}
