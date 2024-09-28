import 'package:get/get.dart';

import '../../components/styles/app_strings.dart';

class CoursesController extends GetxController{
  RxInt selectCourse = (-1).obs;
  String descText = AppStrings.dummyText;
  RxBool descTextShowFlag = false.obs;
  setCourse(index){
    descTextShowFlag.value = !descTextShowFlag.value;
    selectCourse.value = index;
  }
}