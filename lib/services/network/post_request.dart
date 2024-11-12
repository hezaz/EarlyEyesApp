import 'package:early_eyes/feature/data/models/requestModels/change_password_res_model.dart';
import 'package:early_eyes/feature/data/models/requestModels/help_res_model.dart';
import 'package:early_eyes/services/network/remote_services.dart';
import '../../feature/data/models/requestModels/add_child_res_model.dart';
import '../../feature/data/models/requestModels/forgot_password_res_model.dart';
import '../../feature/data/models/requestModels/login_res_model.dart';
import '../../feature/data/models/requestModels/parent_res_model.dart';
import '../../feature/data/models/requestModels/parent_update_res_model.dart';
import '../../feature/data/models/requestModels/student_res_model.dart';
import '../../feature/data/models/requestModels/teacher_res_model.dart';
import '../../feature/data/models/requestModels/teacher_update_res_model.dart';
import 'ApiUrls.dart';

class PostRequests {
  PostRequests._();
  static Future<StudentResModel?> studentRegister(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.studentRegister, imagesData);

    if (apiResponse != null) {
      return studentResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<TeacherSignupResModel?> teacherRegister(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.teacherRegister, imagesData);

    if (apiResponse != null) {
      return teacherSignupResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<ParentSignupResModel?> parentRegister(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.parentRegister, imagesData);

    if (apiResponse != null) {
      return parentSignupResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<AddChildResModel?> addChild(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.addChild, imagesData);

    if (apiResponse != null) {
      return addChildResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<ParentSignupResModel?> editChild(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.editChild, imagesData);

    if (apiResponse != null) {
      return parentSignupResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<LoginResModel?> userLogin(
      Map<String, String>requestBody) async {
    var apiResponse = await RemoteService.simplePost(requestBody,
        ApiUrls.loginUser);
    print("loginData $requestBody");
    if (apiResponse != null) {
      return loginResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<ForgotPasswordResModel?> forgotPassword(
      Map<String, String>requestBody) async {
    var apiResponse = await RemoteService.simplePost(requestBody,
        ApiUrls.forgotPassword);

    if (apiResponse != null) {
      return forgotPasswordResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<ChangePasswordResModel?> changePassword(
      Map<String, String>requestBody) async {
    var apiResponse = await RemoteService.simplePost(requestBody,
        ApiUrls.changePassword);

    if (apiResponse != null) {
      return changePasswordResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<ParentUpdateResModel?> editParentInfo(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.parentUpdate, imagesData);

    if (apiResponse != null) {
      return parentUpdateResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<TeacherUpdateResModel?> editTeacherInfo(
      Map<String, String>requestBody,
      Map<String,dynamic>? imagesData) async {
    var apiResponse = await RemoteService.simplePostWithImage(requestBody,
        ApiUrls.teacherUpdate, imagesData);

    if (apiResponse != null) {
      return teacherUpdateResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<HelpResModel?> needHelp(
      Map<String, String>requestBody) async {
    var apiResponse = await RemoteService.simplePost(requestBody,
        ApiUrls.needHelp);

    if (apiResponse != null) {
      return helpResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
}

