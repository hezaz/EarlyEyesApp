import 'dart:convert';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../feature/data/models/dataModels/common_res_model.dart';
import '../../utils/appUtils.dart';
import '../../utils/helpers.dart';
import '../../utils/internet_connections/internet_connections.dart';
import '../prefrences/prefrences.dart';
import 'ApiUrls.dart';

class RemoteService {
  static var client = http.Client();

  static const String _baseUrl = ApiUrls.baseUrl;

  static Map<String, String> getHeaders() {
    String? bearerToken = Preferences.getPref(Preferences.authToken) as String?;
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json;charset=utf-8"
    };
    if (bearerToken != null) {
      headers.addAll({"Authorization": "Bearer$bearerToken"});}
    return headers;
  }

  static Future<Map<String, String>> getHeadersFileUpload() async {
    String? bearerToken =
        Preferences.getPref(Preferences.authToken) as String?;
    Map<String, String> headers = {
      // "Accept": "application/json",
      // "Content-Type": "application/json;charset=utf-8"
    };

    if (bearerToken != null) {
      headers.addAll({"Authorization": "Bearer $bearerToken"});
    }
    return headers;
  }

  static Future<CommonResModel?> simplePost(
      Map<String, dynamic> requestBody, String endUrl) async {
    var body = json.encode(requestBody);
    final response = await http.post(Uri.parse(_baseUrl + endUrl),
        headers: getHeaders(), body: body);
    AppUtils.log('${response.body}response');
    AppUtils.log(_baseUrl + endUrl);
    AppUtils.log('${response.statusCode}response');
    var responseCode = response.statusCode;

    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      AppUtils.log(response.body);
      try {
        final map = jsonDecode(response.body) as Map<String, dynamic>;
        AppAlerts.alert(message: '${map['message']}');

        throw map['message'];
      } catch (e) {
        return null;
      }
    }
  }

  static Future<CommonResModel?> simplePostWithImage(
      Map<String, String> requestBody,
      String endUrl,
      Map<String, dynamic>? imagesData) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(_baseUrl + endUrl));
    request.headers.addAll(await getHeadersFileUpload());


    if (imagesData != null) {
      for (String key in imagesData.keys) {
        request.files
            .add(await http.MultipartFile.fromPath(key, imagesData[key]!));
      }
    }

    request.fields.assignAll(requestBody);

    http.StreamedResponse streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    AppUtils.log('${response.body}response');
    AppUtils.log(_baseUrl + endUrl);
    AppUtils.log('${response.statusCode}response');

    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      try {
        final map = jsonDecode(response.body) as Map<String, dynamic>;
        AppAlerts.alert(message: '${map['message']}');

        throw map['message'];
      } catch (e) {
        return null;
      }
    }
  }

  static Future<CommonResModel?> simplePut(
      Map<String, dynamic> requestBody, String endUrl) async {
    var isConnected = await InternetConnection.isConnected();

    if (!isConnected) {
      return null;
    }

    Helpers.printLog(
        screenName: 'Remote_Service_simple_put',
        message: "request_data = $requestBody");
    debugPrint('request_url = ${_baseUrl + endUrl}');
    var body = json.encode(requestBody);
    final response = await http.put(Uri.parse(_baseUrl + endUrl),
        headers: getHeaders(), body: body);

    Helpers.printLog(
        screenName: 'Remote_Service_simple_put',
        message: "response = ${response.body}");
    debugPrint('request_url = ${_baseUrl + endUrl}');
    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      return null;
    }
  }

  static Future<CommonResModel?> simpleGet(String endUrl) async {
    final response =
        await http.get(Uri.parse(_baseUrl + endUrl), headers: getHeaders());

    Helpers.printLog(
        screenName: 'Remote_Service_simple_get',
        message: "response = ${response.body}");
    debugPrint('request_url = ${_baseUrl + endUrl}');
    debugPrint('request_headers = ${getHeaders().toString()}');
    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      try {
        final map = jsonDecode(response.body) as Map<String, dynamic>;
        AppAlerts.alert(message: '${map['message']}');

        throw map['message'];
      } catch (e) {
        return null;
      }
    }
  }

  static Future<CommonResModel?> uploadPhotos(
      Map<String, dynamic> imagesData, String endUrl) async {
    var isConnected = await InternetConnection.isConnected();

    if (!isConnected) {
      return null;
    }

    http.MultipartRequest request =
        http.MultipartRequest('post', Uri.parse(_baseUrl + endUrl));
    request.headers.addAll(await getHeadersFileUpload());
    for (String key in imagesData.keys) {
      request.files
          .add(await http.MultipartFile.fromPath(key, imagesData[key]));
    }

    http.StreamedResponse streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    Helpers.printLog(
        screenName: 'Remote_Service_upload_photos',
        message: "response = ${response.body}");
    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      Get.snackbar('error'.tr, 'message_server_error'.tr);
      return null;
    }
  }

  static Future<CommonResModel?> uploadPhotosPost(
      List<String> paths, String endUrl) async {
    var isConnected = await InternetConnection.isConnected();

    if (!isConnected) {
      return null;
    }

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(_baseUrl + endUrl));
    request.headers.addAll(await getHeadersFileUpload());
    for (String path in paths) {
      request.files.add(await http.MultipartFile.fromPath('file', path));
    }

    http.StreamedResponse streamedResponse = await request.send();
    // var responseBytes = await streamedResponse.stream.toBytes();
    // var responseString =  utf8.decode(responseBytes);

    var response = await http.Response.fromStream(streamedResponse);
    Helpers.printLog(
        screenName: 'Remote_Service_upload_photos_post',
        message: "response = ${response.body}");
    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      Get.snackbar('error'.tr, 'message_server_error'.tr);
      return null;
    }
  }

  static Future<CommonResModel?> simpleDelete(String endUrl) async {


    final response =
        await http.delete(Uri.parse(_baseUrl + endUrl), headers: getHeaders());

    AppUtils.log('${response.body}response');
    AppUtils.log('${_baseUrl + endUrl}Url');
    AppUtils.log('${response.statusCode}response');
    var responseCode = response.statusCode;
    if (Helpers.isResponseSuccessful(responseCode)) {
      return CommonResModel(statusCode: responseCode, response: response.body);
    } else {
      try {
        final map = jsonDecode(response.body) as Map<String, dynamic>;
        AppAlerts.alert(message: '${map['message']}');

        throw map['message'];
      } catch (e) {
        return null;
      }
    }
  }
}
