import 'package:flutter/cupertino.dart';

import '../services/network/ApiUrls.dart';


class Helpers {
  Helpers._();
  static const bool isDebug = true;
  static String getCompleteUrl(String? url) {
    if (url == null) return "";

    if (url.startsWith('http')) {
      return url;
    } else {
      return ApiUrls.baseUrlImage+ url;
    }
  }
  static printLog({required String screenName, required String message}) {
    if (isDebug) debugPrint("$screenName ==== $message");
  }

  static bool isResponseSuccessful(int code) {
    return code >= 200 && code < 300;
  }

  static String getImgUrl(String? url) {
    debugPrint("url ======= = $url");

    if (url == null) return '';
    if (url.startsWith('http')) {
      return url;
    } else {
      return ApiUrls.baseUrlImage + url;
    }
  }




}
