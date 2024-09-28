import 'package:get/get.dart';

import '../data/models/dataModels/common_model.dart';

class NotificationController extends GetxController{
  RxInt selectedCard = (-1).obs;
  setIndex(int index){
    selectedCard.value = index;
  }
  var notificationList = <CommonModel>[
    CommonModel(title: '')

  ].obs;
}