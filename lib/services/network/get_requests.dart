
import 'package:early_eyes/feature/data/models/requestModels/banners_res_model.dart';
import 'package:early_eyes/feature/data/models/requestModels/delete_account_res_model.dart';
import 'package:early_eyes/feature/data/models/requestModels/events_res_model.dart';
import 'package:early_eyes/services/network/remote_services.dart';

import '../../feature/data/models/requestModels/courses_res_model.dart';
import '../../feature/data/models/requestModels/get_child_res_model.dart';
import '../../feature/data/models/requestModels/logout_res_model.dart';
import '../../feature/data/models/requestModels/profile_res_model.dart';
import '../../feature/data/models/requestModels/token_refresh_res_model.dart';
import 'ApiUrls.dart';

class GetRequests{
  GetRequests._();
  static Future<ChildResModelModel?> getChildDetails(String id) async {
    var apiResponse =
    await RemoteService.simpleGet('${ApiUrls.getChildDetails}$id');
    if (apiResponse != null) {
      return childResModelModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<CoursesResModel?> getCourses() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.coursesList);
    if (apiResponse != null) {
      return coursesResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }

  static Future<ProfileResModel?> getProfile() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.getProfile);
    if (apiResponse != null) {
      return profileResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<LogoutResModel?> userLogout() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.logout);
    if (apiResponse != null) {
      return logoutResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<DeleteAccResModel?> deleteAccount() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.deleteAccount);
    if (apiResponse != null) {
      return deleteAccResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<TokenRefreshResModel?> refreshToken(String id) async {
    var apiResponse =
    await RemoteService.simpleGet('${ApiUrls.tokenRefresh}$id');
    if (apiResponse != null) {
      return tokenRefreshResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<EventsResModel?> getEvents() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.events);
    if (apiResponse != null) {
      return eventsResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
  static Future<BannersResModel?> getBanners() async {
    var apiResponse =
    await RemoteService.simpleGet(ApiUrls.banners);
    if (apiResponse != null) {
      return bannersResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
}