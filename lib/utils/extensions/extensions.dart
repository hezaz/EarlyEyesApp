import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

import '../enum.dart';

extension TextEditControllerExtn on TextEditingController{
  String get getText  => text.trim();
}













extension NumExtn on num{
  get numToDouble => this is int ? this.toDouble() : num;
}


extension mapExtn on Map<String,dynamic>{
  List<PartValue> get getPartList {
    return entries.map((data) => PartValue(data.key,data.value)).toList();
}
}



extension StringExtn on String {
// password condition check....
  bool get isPassword => length > 6 && length < 25;
  bool isEquals(String value) => compareTo(value) == 0;
  bool get isPinCode {
    // if (length > 16 || length < 9) return false;

    if (length != 6) return false;
    return _hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }
  bool get isPhone {
    // if (length > 16 || length < 9) return false;

    if (length != 13) return false;
    return _hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }
  // bool get isEmail => _hasMatch(this,
  //
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{ 1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  String get getFileName {
    int lastIndex = lastIndexOf('/');
    if (lastIndex != -1 && lastIndex < length - 1) {
      return substring(lastIndex + 1); }
    return this; }
  String get getFileExtension {
    int lastIndex = lastIndexOf('.');
    if (lastIndex != -1 && lastIndex < length - 1) {
      return substring(lastIndex); }
    return ''; }
  bool get isNum {
    if (trim().isEmpty) return false; return num.tryParse(this) is num;
  }
  num get getNum => num.parse(this);
  String get phoneNohide => replaceRange(5, length - 2, '*' * (length - 7));


  SignUpType? get getUserRole{
    if(SignUpType.studentType.name == this){
      return SignUpType.studentType;
    }else if(SignUpType.parentType.name == this){
      return SignUpType.parentType;
    }else if(SignUpType.tutorType.name == this){
      return SignUpType.tutorType;
    }else{
      return null;
    }
}

}
bool _hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}



extension ListStringify<T> on List<T> {
  String stringify() {
    if (this.isEmpty) return ''; // Return empty string if the list is empty
    // Use join() to concatenate the string representations of elements
    // within the list separated by commas
    return this.map((element) => element.toString()).join(', ');
  }
}
