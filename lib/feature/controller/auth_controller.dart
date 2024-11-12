import 'package:early_eyes/components/styles/appImages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../components/coreComponents/common_toast.dart';
import '../../components/styles/appColors.dart';
import '../../components/styles/app_strings.dart';
import '../../services/network/post_request.dart';
import '../../services/prefrences/prefrences.dart';
import '../../utils/device_info.dart';
import '../../utils/enum.dart';
import '../data/models/dataModels/common_model.dart';
import '../data/models/dataModels/image_data_model.dart';
import '../data/models/requestModels/profile_res_model.dart';
import '../presentation/pages/home/home_screen.dart';
import '../presentation/pages/parent/add_child/child_details_screen.dart';


class AuthController extends GetxController {
  @override
  void onInit() {
    formattedDate.value =
        DateFormat('yyyy-MM-dd').format(selectedDate.value).toString();
    super.onInit();
  }

  //---------------------controllers------------------------//
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final addNoteCtrl = TextEditingController();
  final mailingAdrCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final schoolNCtrl = TextEditingController();
  final tutorEmailCtrl = TextEditingController();
  var showDetails = false.obs;

  clearFromData() {
    emailCtrl.clear();
    nameCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();
    dobCtrl.clear();
    addNoteCtrl.clear();
    mailingAdrCtrl.clear();
    mobileCtrl.clear();
    schoolNCtrl.clear();
    tutorEmailCtrl.clear();
  }

  //-----------------------[SignUp]----------------------------------------
  RxInt selectedCard = (-1).obs;

  setIndex(int index) {
    selectedCard.value = index;
  }

  var joinType = <CommonModel>[
    CommonModel(
      title: AppStrings.student,
      image: AppImages.student,
      subtitle: AppStrings.studentMsg,
    ),
    CommonModel(
      title: AppStrings.parent,
      image: AppImages.parents,
      subtitle: AppStrings.parentMsg,
    ),
    CommonModel(
      title: AppStrings.tutor,
      image: AppImages.tutor,
      subtitle: AppStrings.tutorMsg,
    ),
  ].obs;

  //-------------------------------------[student register]----------------------------------------
  RxBool studentAgreeToTerms = false.obs;
  final stFormKey = GlobalKey<FormState>();
  var showStudent = false.obs;
  var showTutor = false.obs;
  var selectedDate = DateTime.now().obs;
  var formattedDate = "".obs;
  var isLoading = false.obs;


  RxBool genderEr = RxBool(false);
  RxBool expEr = RxBool(false);
  RxBool classEr = RxBool(false);
  checkValidation(){
    genderEr.value = false;
    expEr.value = false;
    classEr.value = false;
  }
  throwError(){
    genderEr.value = true;
    expEr.value = true;
    classEr.value = true;

  }

  RxString? selectGender;
  RxString? selectExp;
  RxString? selectClass;
  final Rx<ImageDataModel> _studentImageCtrl =
  Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get studentImageCtrl => _studentImageCtrl.value;

  void studentImage(ImageDataModel data) {
    print('${studentImageCtrl}_imageCtrl.value');
    _studentImageCtrl.value = data;
    _studentImageCtrl.refresh();
  }

  void selectedGender(String val) {
    genderEr.value = false;
    selectGender ??= RxString('');
    selectGender?.value = val;

    update();
  }

  selectedExp(String val) {
    expEr.value = false;
    selectExp ??= RxString('');
    selectExp?.value = val;
    update();
  }

  selectedClass(String val) {
    classEr.value = false;
    selectClass ??= RxString('');
    selectClass?.value = val;
    update();
  }

  var gender = ["Male", "Female"].obs;
  var experience = [
    "Fresher",
    "Internships",
    "Experienced",
    "Intermediate",
  ].obs;
  var classList = [
    "CP",
    "CE1",
    "CE2",
    "CM1",
    "CM2",
    "6ème",
    "5ème",
    "4ème",
    "3ème",
    "2nde",
    "1ère",
    "Terminale"
  ].obs;



  studentRegister() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    try {
      isLoading.value = true;
      FocusManager.instance.primaryFocus?.unfocus();
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'password': passwordCtrl.text.toString(),
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'gender': selectGender?.value ?? '',
        'class': selectClass?.value ?? '',
        'mailing_address': mailingAdrCtrl.text.toString(),
        'experience': selectExp?.value ?? '',
        'student_email': emailCtrl.text.toString(),
        'comment': addNoteCtrl.text,
        'dob': dobCtrl.text,
      };
      http.MultipartFile? uploadMedia;
      if (studentImageCtrl.file != null) {
        uploadMedia = await http.MultipartFile.fromPath(
            'image', studentImageCtrl.file.toString());
      }
      Map<String, dynamic>? imagesData;
      if (studentImageCtrl.file != null) {
        imagesData = {'profile_pic': studentImageCtrl.file};
      }
      var response =
      await PostRequests.studentRegister(requestBody, imagesData);

      print('Student Register Response: ${requestBody.toString()}');

      if (response != null) {
        if (response.success) {
          saveStudentToPref(response.data);
          Get.offAll(HomeScreen());
        } else {
          // Handle error
        }
      }
    } finally {
      isLoading.value = false;
    }
  }


  void saveStudentToPref(UserData? user) {
    Preferences.user12 = user;
    Preferences.userToken = user?.token;
  }








  //---------------------------------------------[parent register]----------------------------------------
  final parentFormKey = GlobalKey<FormState>();
  RxBool parentAgreeToTerms = false.obs;
  RxBool prentLoader = false.obs;
  var parentData = Rx<UserData?>(null);
  RxString? relation;
  RxBool relationEr = RxBool(false);

  selectRelation(String val) {
    relationEr.value = false;
    relation ??= RxString('');
    relation?.value = val;
    update();
  }

  var relationList = ['Mother', 'Father'].obs;
  final Rx<ImageDataModel> _parentImageCtrl =
  Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get parentImageCtrl => _parentImageCtrl.value;

  void parentImage(ImageDataModel data) {
    print('${parentImageCtrl}_imageCtrl.value');
    _parentImageCtrl.value = data;
    _parentImageCtrl.refresh();
  }



  parentRegister() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    dobCtrl.text = DateFormat('yyyy-MM-dd')
        .format(selectedDate.value)
        .toString();
    try {
      prentLoader.value = true;
      FocusManager.instance.primaryFocus?.unfocus();
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'password': passwordCtrl.text.toString(),
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'dob': dobCtrl.text,
        'relationship': relation?.value ?? '',
        'mobile_number': mobileCtrl.text,
      };
      http.MultipartFile? uploadMedia;
      if (parentImageCtrl.file != null) {
        uploadMedia = await http.MultipartFile.fromPath(
            'image', parentImageCtrl.file.toString());
      }
      Map<String, dynamic>? imagesData;
      if (parentImageCtrl.file != null) {
        imagesData = {'profile_pic': parentImageCtrl.file};
      }
      var response = await PostRequests.parentRegister(requestBody, imagesData);

      print('Parent Register Response: ${response.toString()}');

      if (response?.success == true) {
        saveParentToPref(response?.data);
        CommonToast.show(msg: response?.message ?? "");
        Get.offAll(ChildDetailsScreen());

        parentData.value = response?.data;
        prentLoader.value = false;
        return response?.message ?? '';
      } else {
        prentLoader.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      prentLoader.value = false;
      rethrow;
    }
  }


  void saveParentToPref(UserData? user) {
    Preferences.user12 = user;
    Preferences.userToken = user?.token;
  }







  //--------------------------------------------[tutor register]----------------------------------------

  final tutorFormKey = GlobalKey<FormState>();
  var tutorLoader = false.obs;
  RxString? course;

  selectedCourse(String val) {
    classEr.value = false;
    course ??= RxString('');
    course?.value = val;
    update();
  }

  final Rx<ImageDataModel> _tutorImageCtrl =
  Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get tutorImageCtrl => _tutorImageCtrl.value;

  void tutorImage(ImageDataModel data) {
    print('${tutorImage}_imageCtrl.value');
    _tutorImageCtrl.value = data;
    _tutorImageCtrl.refresh();
  }

  RxList<CommonModel> availableDays = <CommonModel>[
    CommonModel(title: 'Monday'),
    CommonModel(title: 'Tuesday'),
    CommonModel(title: 'Wednesday'),
    CommonModel(title: 'Thursday'),
    CommonModel(title: 'Friday'),
    CommonModel(title: 'Saturday'),
    CommonModel(title: 'Sunday'),
  ].obs;

  onToggle(int index) {
    availableDays[index].isSelected = !availableDays[index].isSelected;
    availableDays.refresh();
  }

  RxString get getSelectedListStringify {
    List<CommonModel> list =
    availableDays.where((element) => element.isSelected == true).toList();
    return list.map((e) => e.title).join(', ').obs;
  }

  var coursesList = [
    "BCA",
    "MCA",
    'BA',
    'MA',
  ].obs;



  teacherRegister() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    try {
      tutorLoader.value = true;
      FocusManager.instance.primaryFocus?.unfocus();
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'mobile_number': mobileCtrl.text.toString(),
        'password': passwordCtrl.text.toString(),
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'gender': selectGender?.value ?? '',
        'school_name': schoolNCtrl.text.toString(),
        'mailing_address': mailingAdrCtrl.text.toString(),
        'experience': selectExp?.value ?? '',
        'tutor_email': tutorEmailCtrl.text.toString(),
        'comment': addNoteCtrl.text,
        'course_id': "1",
        'course_name': course?.value ?? '',
        'course_schedule': "1 hour",
        'dob': dobCtrl.text,
      };
      http.MultipartFile? uploadMedia;
      if (tutorImageCtrl.file != null) {
        uploadMedia = await http.MultipartFile.fromPath(
            'image', tutorImageCtrl.file.toString());
      }
      Map<String, dynamic>? imagesData;
      if (tutorImageCtrl.file != null) {
        imagesData = {'profile_pic': tutorImageCtrl.file};
      }
      var response =
      await PostRequests.teacherRegister(requestBody, imagesData);

      print('Teacher Register Response: ${response.toString()}');

      if (response != null) {
        if (response.success) {
          saveTutorToPref(response.data);
          Preferences.setUserRole = SignUpType.tutorType;
          Get.offAll(HomeScreen(), arguments: {
            "type": SignUpType.tutorType,
          });
        }
      }
    } finally {
      tutorLoader.value = false;
    }
  }


  void saveTutorToPref(UserData? user) {
    Preferences.user12 = user;
    Preferences.userToken = user?.token;
  }






  //-------------------------forgot password-----------------------//

  var checkMail = false.obs;
  var mailLoader = false.obs;
  final forgotPasswordCtrl = TextEditingController();

  forgotPassword() async {
    try {
      mailLoader.value = true;
      FocusManager.instance.primaryFocus?.unfocus();
      Map<String, String> requestBody = {
        'email': forgotPasswordCtrl.text.toString(),
      };
      var response = await PostRequests.forgotPassword(requestBody);
      if (response != null) {
        if (response.success) {
          checkMail.value = true;
        }
      }
    } finally {
      mailLoader.value = false;
    }
  }
  void selectDate(BuildContext context, Rx<DateTime> selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;

      // Set the selected date in the dobCtrl and format as 'yyyy-MM-dd'
      dobCtrl.text = DateFormat('yyyy-MM-dd').format(selectedDate.value).toString();
    }
  }



}
