import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/widgets/commonTabCard.dart';

class SkillsTestController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  final searchCtrl = TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 10, vsync: this);
    super.onInit();
  }

  var tab = [
    CommonTabCard(text: "1",),
    CommonTabCard(text: "2",),
    CommonTabCard(text: '3',),
    CommonTabCard(text: '4'),
    CommonTabCard(text: '5'),
    CommonTabCard(text: '6'),
    CommonTabCard(text: '7'),
    CommonTabCard(text: '8'),
    CommonTabCard(text: '9'),
    CommonTabCard(text: '10'),
   // Tab(child:C,)
  ];
}
