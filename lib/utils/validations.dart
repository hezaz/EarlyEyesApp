import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:get/get.dart';
import 'inputFormats.dart';



const String msg = AppStrings.please;
class Validations {
  Validations._();

  static String? checkEmailValidations(String? value){
    var enteredValue =  value?.trim()??'';
    if(enteredValue.isEmpty){
      return 'Please Enter Your Email';
    }else if(!InputFormats.validEmailExp.hasMatch(enteredValue)){
      return  '$msg ${AppStrings.validEmail}';
    }
    else{
      return null;
    }
  }
  static String? checkPhoneValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return '$msg ${AppStrings.enterPhoneNo}';
    } else if (enteredValue.length != 10) {
      return AppStrings.enterValidPhoneNo;
    } else {
      return null;
    }
  }
  static String? checkNameValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return 'Please Enter Your Full Name'.tr;
    } else {
      return null;
    }
  }
  static String? checkCityValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return "Please Enter Your City Name ".tr;
    } else {
      return null;
    }
  }
  static String? checkEmptyFieldValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return "This field is required".tr;
    } else {
      return null;
    }
  }

  static String? checkOldPasswordValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return "Please Enter Your University Name".tr;
    } else {
      return null;
    }
  }
  static String? checkDobValidations(String? value) {
    var enteredValue = value?.trim() ?? '';
    if (enteredValue.isEmpty) {
      return "Please Select DOB".tr;
    } else {
      return null;
    }
  }
  static String? checkPasswordValidations(String? value){
    var enteredValue   =  value?.trim()??'';
    if(enteredValue.isEmpty){
      return AppStrings.messageEnterPassword;
    }
     else if(enteredValue.length<8){
      return  AppStrings.messagePasswordLength;
    }

    else{
      return null;
    }
  }


  static String? checkConfirmPasswordValidations(String? value,String? password){
    var enteredValue   =  value?.trim()??'';
    if(enteredValue.isEmpty){
      return  AppStrings.messageConfirmPassword;
    }
    else if(password != enteredValue){
      return "Confirm Password Doesn't Match";
    }
    else if(password!.isEmpty){
      return AppStrings.messagePasswordSame;
    }
    else{
      return null;
    }
  }
}
