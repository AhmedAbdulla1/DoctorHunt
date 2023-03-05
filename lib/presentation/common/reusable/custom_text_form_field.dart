// import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

Widget customTextFormField({
  required Stream<String?> stream,
  required TextEditingController textEditingController,
  TextInputType textInputType = TextInputType.emailAddress,
  required String hintText,
}) {
  return StreamBuilder<String?>(
    stream: stream,
    builder: (context, snapshot) => TextFormField(
      style: getLightStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(hintText: hintText, errorText: snapshot.data),
    ),
  );
}

//
Widget customPasswordFormField({
  required Stream<String?> stream1,
  required Stream<bool> stream2,
  required TextEditingController textEditingController,
  required VoidCallback onPressed,

}) {
  return StreamBuilder2<String?, bool>(
    streams: StreamTuple2(stream1, stream2),
    builder: (context, snapshot) => TextFormField(

      style: getLightStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      keyboardType: TextInputType.visiblePassword,
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: !(snapshot.snapshot2.data ?? true)
              ? Icon(
                  Icons.visibility,
                  color: ColorManager.lightGrey,
                )
              : Icon(Icons.visibility_off, color: ColorManager.lightGrey),
        ),
        hintText: AppStrings.password,
        errorText: snapshot.snapshot1.data,
      ),
      obscureText: snapshot.snapshot2.data ?? true,
    ),
  );
}
