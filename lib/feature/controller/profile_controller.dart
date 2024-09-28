import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/pages/profile/project_screen.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../components/coreComponents/ImageView.dart';
import '../../components/styles/appImages.dart';
import '../../services/network/ApiUrls.dart';
import '../../services/network/get_requests.dart';
import '../../services/network/post_request.dart';
import '../../utils/device_info.dart';
import '../data/models/dataModels/common_model.dart';
import '../data/models/dataModels/image_data_model.dart';
import '../data/models/requestModels/profile_res_model.dart';
import 'package:http/http.dart' as http;


class ProfileController extends GetxController {
  XFile? selectedImage;
  ImagePicker? _picker;
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final tutorCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final studentCtrl = TextEditingController();
  final mailCtrl = TextEditingController();
  final cmtCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final nPassCtrl = TextEditingController();
  final oPassCtrl = TextEditingController();
  final cPassCtrl = TextEditingController();
  final reportEmailCtrl = TextEditingController();
  final reportTitleCtrl = TextEditingController();
  final reportMessageCtrl = TextEditingController();
  final projectNameCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final urlCtrl = TextEditingController();

  var selectedDate = DateTime.now().obs;
  var formattedDate = "".obs;

  @override
  void onInit() {
    getUserProfile();
    formattedDate.value =
        DateFormat('yyyy-MM-dd').format(selectedDate.value).toString();
    super.onInit();
  }
  RxInt selectedTab = (-1).obs;
  tabView(index) {
    selectedTab.value = index;
  }
  var userProfile = Rx<UserDetails?>(null);
  var getProfile = Rx<UserData?>(null);
  var quizOptions = <CommonModel>[
    CommonModel(
        image: AppImages.menu,
        title: AppStrings.viewResult,
        child: ProjectScreen()),
    CommonModel(image: AppImages.retake, title: AppStrings.retakeQuiz),
    CommonModel(image: AppImages.share, title: AppStrings.shareScore),
  ].obs;
  var profileLoader = false.obs;
  var logoutLoader = false.obs;



  getUserProfile() async {
    try {
      profileLoader.value = true;

      var response = await GetRequests.getProfile();
      if (response != null) {
        if (response.success) {
          getProfile.value = response.getProfile;
          userProfile.value = response.getProfile?.userDetails;
        }
      }
    } finally {
      profileLoader.value = false;
    }
  }



  var showDetails = false.obs;
  RxInt selectedIndex = (-1).obs;

  setIndex(int index) {
    selectedIndex.value = index;
  }

  var accountOptions = <CommonModel>[
    CommonModel(
        image: AppImages.profileOutlined,
        title: AppStrings.editProfile,
        onTap: () {}),
    CommonModel(
        image: AppImages.password,
        title: AppStrings.changePassword,
        onTap: () {}),
  ];
  var supportOptions = <CommonModel>[
    CommonModel(image: AppImages.faq, title: AppStrings.faq, onTap: () {}),
    CommonModel(
        image: AppImages.aboutUs, title: AppStrings.aboutUs, onTap: () {}),
    CommonModel(
        image: AppImages.termConditions,
        title: AppStrings.termsConditions,
        onTap: () {}),
    CommonModel(
        image: AppImages.privacyPolicy,
        title: AppStrings.privacyPolicy,
        onTap: () {}),
  ];
  var actionsOptions = <CommonModel>[
    CommonModel(
        image: AppImages.report, title: AppStrings.report, onTap: () {}),
    CommonModel(
        image: AppImages.logout, title: AppStrings.logout, onTap: () {}),
    CommonModel(
        image: AppImages.delete, title: AppStrings.deleteAcc, onTap: () {}),
  ];

  Rx<String?> course = Rx(null);
  Rx<String?> selectGender = Rx(null);
  Rx<String?> selectExp = Rx(null);
  Rx<String?> selectClass = Rx(null);
  Rx<String?> relation = Rx(null);


  selectedCourse(String val) {
    course ??= RxString('');
    course.value = val;
    update();
  }

  var coursesList = [
   "BCA",
    "MCA",
    'BA',
    'MA',


  ].obs;
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

  void selectedGender(String val) {
    selectGender ??= RxString('');
    selectGender.value = val;
    update();
  }

  selectedExp(String val) {
    selectExp ??= RxString('');
    selectExp.value = val;
    update();
  }

  selectedClass(String val) {
    selectClass ??= RxString('');
    selectClass.value = val;
    update();
  }



  selectRelation(String val) {
    relation ??= RxString('');
    relation.value = val;
    update();
  }

  var relationList = ['Mother', 'Father'].obs;
  var termsAndConditions = <CommonModel>[
    CommonModel(title: AppStrings.condition1, subtitle: AppStrings.condition5),
    CommonModel(title: AppStrings.condition2, subtitle: AppStrings.condition6),
    CommonModel(title: AppStrings.condition3, subtitle: AppStrings.condition7),
    CommonModel(title: AppStrings.condition4, subtitle: AppStrings.condition8),
  ];
  var collectInformation = [
    "Full name",
    "Age",
    "Date of birth",
    "Email address",
    "Gender",
    "Class/grade",
    "Tutor education and credentials",
  ];
  var useInformation = [
    "Provide and improve our services",
    "Facilitate communication between students, parents, and tutors",
    "Monitor and analyze usage and trends to improve your experience",
    "Process transactions and send related information",
  ];
  var sharingInformation = [
    "With your consent",
    "For processing transactions (e.g., payment processing)",
    "To comply with legal obligations",
  ];
  var isLoading = false.obs;

  Future<String> changePassword() async {
    try {
      isLoading.value = true;
      Map<String, String> requestBody = {
        'old_password': oPassCtrl.text.toString().trim(),
        'new_password': nPassCtrl.text.toString().trim(),
      };
      var response = await PostRequests.changePassword(requestBody);
      if (response?.success == true) {
        return response?.message ?? '';
      } else {
        isLoading.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }





  final Rx<ImageDataModel> _updateImageCtrl =
      Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get parentImageCtrl => _updateImageCtrl.value;

  void parentImage(ImageDataModel data) {
    print('${parentImageCtrl}_imageCtrl.value');
    _updateImageCtrl.value = data;
    _updateImageCtrl.refresh();

    Logger().d(parentImageCtrl.file);
  }

  getProfileData() {
    final data = Preferences.user;
    final image = data?.userDetails?.profilePic.toString();

    parentImage(ImageDataModel(
        network: ApiUrls.baseUrlImage + image.toString(),
        type: image != null ? ImageType.network : null));
  }

  //-----------------------update Parent ------------------------//
  final childNCtrl = TextEditingController();
  final childEmailCtrl = TextEditingController();
  var parentLoader = false.obs;

  Future<String> updateParentInfo() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    try {
      parentLoader.value = true;
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'dob': dobCtrl.text,
        'relationship': relation.value ?? '',
        'mobile_number': phoneCtrl.text,
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
      Logger().e('-----------------requestBody----------------------');
      Logger().e(requestBody);

      var response = await PostRequests.editParentInfo(requestBody, imagesData);
      if (response?.success == true) {
        Preferences.user = response?.data;
        Get.put(HomeController()).getUserProfile();
        Get.put(HomeController()).userProfile.refresh();
        Get.put(HomeController()).getProfile.refresh();
        getUserProfile();

        getUserDataFromPref();
        parentLoader.value = false;
        return response?.message ?? '';
      } else {
        parentLoader.value = false;
        throw AppAlerts.error(response?.message ?? "");
      }
    } catch (e) {
      parentLoader.value = false;
      rethrow;
    }
  }

  void getUserDataFromPref() {
    Logger().e('-----------------getUserDataFromPref----------------------');
    Logger().e(Preferences.user?.userDetails?.gender);
    nameCtrl.text = Preferences.user?.fullName ?? '';
    emailCtrl.text = Preferences.user?.email ?? '';
    studentCtrl.text = Preferences.user?.userDetails?.studentEmail ?? '';
    tutorCtrl.text = Preferences.user?.userDetails?.tutorEmail ?? '';
    selectGender.value = Preferences.user?.userDetails?.gender ?? '';
    selectExp.value = Preferences.user?.userDetails?.experience ?? '';
    selectClass.value = Preferences.user?.userDetails?.userDetailsClass?? '';
    cmtCtrl.text = Preferences.user?.userDetails?.comment ?? '';
    tutorCtrl.text = Preferences.user?.userDetails?.tutorEmail ?? '';
    phoneCtrl.text = Preferences.user?.mobileNumber ?? '';
    course.value =  Preferences.user?.userDetails?.courseName ?? '';
    relation.value = Preferences.user?.userDetails?.relationship ?? '';
    dobCtrl.text = Preferences.user?.userDetails?.dob != null ?
        DateFormat('dd-MM-yyyy').format(DateTime.parse(Preferences.user!.userDetails!.dob.toString())) :
        '';
    Logger().d('------------------dateconverter----------------------');
    Logger().d(dobCtrl.text);
    relation.value =
        Preferences.user?.userDetails?.relationship.toString() ?? '';
    phoneCtrl.text = Preferences.user?.mobileNumber ?? '';
    parentImageCtrl.file = Preferences.user?.userDetails?.profilePic;
    update();
  }

  Future<String> updateTeacherInfo() async {
    try {
      parentLoader.value = true;
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'mobile_number': phoneCtrl.text.toString(),
        'gender': selectGender.value ?? '',
        'school_name': Preferences.user?.userDetails?.schoolName ?? '',
        'mailing_address': Preferences.user?.userDetails?.mailingAddress ?? '',
        'experience': selectExp.value ?? '',
        'tutor_email': tutorCtrl.text.toString(),
        'comment': cmtCtrl.text.toString(),
        'course_id':'1',
        'course_name': course.value ?? '',
        'course_schedule': "1 Hour",
        'dob': dobCtrl.text,
      };
      Logger().d(requestBody);
      Logger().d("requestBody>>>>");
      http.MultipartFile? uploadMedia;
      if (parentImageCtrl.file != null) {
        uploadMedia = await http.MultipartFile.fromPath(
            'image', parentImageCtrl.file.toString());
      }
      Map<String, dynamic>? imagesData;
      if (parentImageCtrl.file != null) {
        imagesData = {'profile_pic': parentImageCtrl.file};
      }
      var response =
          await PostRequests.editTeacherInfo(requestBody, imagesData);
      if (response?.success == true) {
        parentLoader.value = false;
        Preferences.user = response?.data;

        Preferences.user = response?.data;
        Get.put(HomeController()).getUserProfile();
        Get.put(HomeController()).userProfile.refresh();
        Get.put(HomeController()).getProfile.refresh();
        getUserProfile();
        getUserDataFromPref();
        return response?.message ?? '';
      } else {
        parentLoader.value = false;
        throw AppAlerts.error(response?.message ?? "");
      }
    } catch (e) {
      parentLoader.value = false;
      rethrow;
    }
  }

  // getStudentPref() {
  //   Logger().e('-----------------getStudentPref----------------------');
  //   nameCtrl.text = Preferences.user?.fullName ?? '';
  //   emailCtrl.text = Preferences.user?.email ?? '';
  //   // selectGender?.value = Preferences.user?.userDetails?.gender ?? '';
  //   selectExp.value = Preferences.user?.userDetails?.experience ?? '';
  //   cmtCtrl.text = Preferences.user?.userDetails?.comment ?? '';
  //   dobCtrl.text = Preferences.user?.userDetails?.dob != null ?
  //   DateFormat('dd-MM-yyyy').format(DateTime.parse(Preferences.user!.userDetails!.dob.toString())) :
  //   '';
  //   parentImageCtrl.file = Preferences.user?.userDetails?.profilePic ?? "";
  //   phoneCtrl.text = Preferences.user?.mobileNumber ?? '';
  // }

  var studentLoader = false.obs;

  Future<String> updateStudentInfo() async {
    try {
      studentLoader.value = true;
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'gender': selectGender.value ?? "",
        'class': selectClass.value ?? '',
        'mailing_address': "abc@gmail.com",
        'experience': selectExp.value  ?? '',
        'comment': cmtCtrl.text,
        'mobile_number': phoneCtrl.text,
        'dob': dobCtrl.text,
        'child_id': Preferences.user?.id.toString() ?? '',
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
      var response = await PostRequests.editChild(requestBody, imagesData);
      if (response?.success == true) {
        Preferences.user = response?.data;
        studentLoader.value = false;
        Get.put(HomeController()).getUserProfile();
        Get.put(HomeController()).userProfile.refresh();
        Get.put(HomeController()).getProfile.refresh();
        getUserDataFromPref();
        getUserProfile();
        return response?.message ?? '';
      } else {
        studentLoader.value = false;
        throw AppAlerts.error(response?.message ?? "");
      }
    } catch (e) {
      studentLoader.value = false;
      rethrow;
    }
  }

}
