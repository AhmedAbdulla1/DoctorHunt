import 'package:flutter/cupertino.dart';

extension NonNullableString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}
extension NonNullableInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension Space on double?{
  SizedBox ph(){
    return SizedBox(height: this,);
  }
  SizedBox pw(){
    return SizedBox(width: this,);
  }
}