import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/models/dataModels/common_model.dart';

class MessagesController extends  GetxController{
  final searchCtrl = TextEditingController();
  var messagesList = <CommonModel>[].obs;
}