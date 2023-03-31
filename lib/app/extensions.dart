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

extension FristName on String {
  String toCapitalizedCase(){
    if(length!=0){
    final characters = this.characters.toList();
    characters[0]=this[0].toUpperCase();
    int index= indexOf(' ', 0);
    characters[index + 1]=this[index+1].toUpperCase();
      return characters.join('');
    }else {
      return this;
    }
  }

  // String smallSentence() {
  //   if (length > 30) {
  //     return substring(0, 30);
  //   } else {
  //     return this;
  //   }
  // }


  String firstName() {
    int startIndex = 0, indexOfSpace=0;
    indexOfSpace = indexOf(' ', startIndex);
      if (indexOfSpace == -1) {
        //-1 is when character is not found
        return this;
      }
    return substring(0,indexOfSpace);
  }
  // String doctorName
}
extension Space on double? {
  SizedBox ph() {
    return SizedBox(
      height: this,
    );
  }

  SizedBox pw() {
    return SizedBox(
      width: this,
    );
  }
}
