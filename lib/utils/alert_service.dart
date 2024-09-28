


import 'package:early_eyes/components/styles/appColors.dart';
import 'package:get/get.dart';

class AppAlerts{

  AppAlerts._();



  static error(String message){
    Get.closeAllSnackbars();
    Get.snackbar('error'.tr, message,colorText: AppColors.black);
  }
  static success(String message){
    Get.closeAllSnackbars();
    Get.snackbar('success'.tr, message,colorText: AppColors.black);
  }

  static alert({String? title,required String message}){
    Get.closeAllSnackbars();
    Get.snackbar(title??'Alert', message,colorText: AppColors.black);
  }









}