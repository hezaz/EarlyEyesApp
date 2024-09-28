
import 'package:early_eyes/core/error.dart';

class ResponseData<T>{
  bool isSuccess;
  Exception? exception;
  Failure? failure;
  T? data;
  ResponseData({required this.isSuccess, this.exception,this.failure, this.data});

  Object get getError => failure != null ? failure! : exception!;

}