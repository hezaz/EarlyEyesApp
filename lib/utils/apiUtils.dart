import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';


import '../core/error.dart';
import '../feature/data/models/dataModels/responseData.dart';
import 'appUtils.dart';

class ApiUtils {
  static Map<String, dynamic> bodyToMap(Response data) =>
      data.body is Map<String, dynamic>
          ? data.body
          : jsonDecode(data.body) as Map<String, dynamic>;

  static Future<Response> hitApi(Future<Response<dynamic>> apiRequest) async {
    // try {
    await _checkConnectivity();
    final result = await apiRequest;
    // AppUtils.logEr(result.error);

    if (result.isSuccessful) {
      return result;
    } else {
      var errorData;

      if(result.error != null && result.error is String){
        final error = result.error as String;
        final map = jsonDecode(error) as Map<String,dynamic>;

        errorData = map['message'];
        throw errorData;
      }else{
        throw Exception(_throwException(result.statusCode));
      }

    }
  }

  static String _throwException(int statusCode) {
    String error = '';
    switch (statusCode) {
      case 400:
        error = 'BadRequestException';
      case 401:
        error = 'UnauthorisedException';
      case 403:
        error = 'access to the requested resource is forbidden';
      case 500:
        error = 'Internal Server Error';
      default:
        error = '';
    }
    return error;
  }

  static Future<void> _checkConnectivity() async {
    if(await _NetworkInfo(InternetConnectionChecker()).isConnected){
      return ;
    }else{
      throw const InternetFailure(error: 'Internet not connected');
    }

  }


  static ResponseData<T> getExceptionData<T>(e){
    return ResponseData(isSuccess: false,
        exception: e is Exception ? e : Exception(e),
        failure: e is Failure ? e : null
    );
  }

  static ResponseData<T> wrapResponseData<T>(T data){
    return ResponseData(isSuccess: true, data: data);
  }
}


abstract class _INetworkInfo {
  Future<bool> get isConnected;
}

class _NetworkInfo implements _INetworkInfo {
  final InternetConnectionChecker connectionChecker;
  _NetworkInfo(this.connectionChecker);
  @override
  Future<bool> get isConnected async => Platform.isAndroid || Platform.isIOS
      ? await connectionChecker.hasConnection
      : true;
}


