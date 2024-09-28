import 'dart:developer';
import 'package:early_eyes/feature/data/models/requestModels/events_res_model.dart';
import 'package:early_eyes/services/network/post_request.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../components/styles/appImages.dart';
import '../../components/styles/app_strings.dart';
import '../../services/network/get_requests.dart';
import '../../services/prefrences/prefrences.dart';
import '../../utils/appUtils.dart';
import '../../utils/enum.dart';
import '../data/models/dataModels/common_model.dart';
import '../data/models/requestModels/banners_res_model.dart';
import '../data/models/requestModels/courses_res_model.dart';
import '../data/models/requestModels/profile_res_model.dart';
import '../presentation/pages/courses/course_screen.dart';
import '../presentation/pages/home/home_screen.dart';
import '../presentation/pages/messages/messages_screen.dart';
import '../presentation/pages/parent/parent_profile/parent_profile_screen.dart';
import '../presentation/pages/settings/settings_page/privacy_policy_screen.dart';
import '../presentation/pages/settings/settings_page/terms_conditions_screen.dart';
import '../presentation/pages/settings/settings_screen.dart';
import '../presentation/pages/student/student_profile/profile_screen.dart';
import '../presentation/pages/tutor/tutor_profile/teacher_profile_screen.dart';

class HomeController extends GetxController {
  RxInt selectedTab = (-1).obs;

  tabView(index) {
    selectedTab.value = index;
  }

  final searchController = TextEditingController();
  var userProfile = Rx<UserDetails?>(null);
  var getProfile = Rx<UserData?>(null);
  Rx<SignUpType>? signUpType;
  var isLoading = false.obs;
  var bannerLoading = false.obs;
  var helpLoader = false.obs;
  String id = '${Preferences.user?.roleId}';
  var courses = <Courses>[].obs;
  var banners = <Banners>[].obs;
  var events = <Events>[].obs;
  var courseDescription = "".obs;
  var thumbnail = "".obs;
  var courseTitle = "".obs;
  int? courseId;
  final formKey = GlobalKey<FormState>();

  final titleCtrl = TextEditingController();
  final courseCtrl = TextEditingController();
  final messageCtrl = TextEditingController();

  @override
  void onInit() {
    getUserProfile();
    getCourses();
    getArguments();
    getEvents();
    getBanners();
    getDetails('');
    print("${Preferences.user?.roleId}roleId");

    super.onInit();
  }
  void onClearState() {
    Logger().d('----clear data ---------');
   messageCtrl.clear();
    courseName.value = null;
  }
  refreshToken() async {
    var response = await GetRequests.refreshToken(id);
    if (response?.success == true) {
      Preferences.userToken = response?.token;
    }
  }

  getArguments() {
    Map<String, dynamic>? data = Get.arguments;
    if (data != null) {
      signUpType?.value = data["type"];
    }
  }

  Rx<String?> course = Rx(null);

  var courseName = Rx<Courses?>(null);

  onChanged(Courses value) {
    helpEr.value = false;

    courseId = value.id;
    courseName.value = value;
    print('${courseName.value?.id} courseName.value');
    update();
  }

  selectedCourse(String val) {
    course ??= RxString('');
    course.value = val;
    update();
  }

  var courseList = [
    "BCA",
    "MCA",
    'BA',
    'MA',
  ].obs;

  getDetails(id) {
    final courseDetails = courses;
    final courseDetailsId =
        courseDetails.indexWhere((element) => element.id == id);
    Logger().d('------$id ----- $courseDetailsId');
    if (courseDetailsId > -1) {
      final details = courseDetails[courseDetailsId];
      courseDescription.value = details.courseDescription ?? '';
      courseTitle.value = details.courseTitle ?? '';
      thumbnail.value = details.courseThumbnails ?? '';

      log('${courseDescription.value}----details----'
          '${courseDescription.value}---title---${thumbnail.value}'
          '--thumbnail-----');
    }
  }

  getUserProfile() async {
    try {
      isLoading.value = true;

      var response = await GetRequests.getProfile();
      if (response != null) {
        if (response.success) {
          Preferences.user = response.getProfile;
          getProfile.value = response.getProfile;
          userProfile.value = response.getProfile?.userDetails;
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  RxInt currentImageIndex = 0.obs;

  var myCoursesList = <CommonModel>[
    CommonModel(
        title: "Flutter", subtitle: "Programming", image: AppImages.test3),
    CommonModel(
        title: "React Js", subtitle: "Programming", image: AppImages.test2),
    CommonModel(
        title: "Android", subtitle: "Programming", image: AppImages.test),
  ].obs;
  RxList<String> imgList = [
    AppImages.slider,
    AppImages.slider,
    AppImages.slider,
  ].obs;

  var logoutLoader = false.obs;

  Future<String> userLogout() async {
    try {
      logoutLoader.value = true;
      var response = await GetRequests.userLogout();
      if (response?.success == true) {
        Get.deleteAll();
        Preferences.removeUserData();
        Get.back();
        return response?.message ?? "";
      } else {
        logoutLoader.value = false;

        Preferences.removeUserData();
        Preferences.user == null;
        throw response?.message ?? "";
      }
    } catch (e) {
      logoutLoader.value = false;
      rethrow;
    }
  }

  var deleteAccLoader = false.obs;

  Future<String> deleteAccount() async {
    try {
      deleteAccLoader.value = true;
      var response = await GetRequests.deleteAccount();
      if (response?.success == true) {
        Get.back();
        return response?.message ?? "";
      } else {
        deleteAccLoader.value = false;
        throw response?.message ?? "";
      }
    } catch (e) {
      deleteAccLoader.value = false;
      rethrow;
    }
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
  var drawerList = <CommonModel>[
    CommonModel(
        title: AppStrings.home,
        child: HomeScreen(),
        subtitle: AppImages.home,
        description: AppImages.homeGrey),
    CommonModel(
        title: AppStrings.courses,
        child: CourseScreen(),
        subtitle: AppImages.courses,
        description: AppImages.coursesGrey),
    CommonModel(
        title: AppStrings.profile,
        child: Preferences.user?.roleId == 1
            ? ProfileScreen()
            : Preferences.user?.roleId == 2
                ? ParentProfileScreen()
                : TeacherProfileScreen(),
        subtitle: AppImages.profile2,
        description: AppImages.profileGrey),
    CommonModel(
        title: AppStrings.chats,
        child: MessagesScreen(),
        subtitle: AppImages.chats,
        description: AppImages.chatsGrey),
    CommonModel(
        title: AppStrings.settings,
        child: SettingsScreen(),
        subtitle: AppImages.settings,
        description: AppImages.settingsGrey),
    CommonModel(
        title: AppStrings.privacyPolicy,
        child: PrivacyPolicyScreen(),
        subtitle: AppImages.privacyPolicyBlue,
        description: AppImages.privacyPolicyGrey),
    CommonModel(
        title: AppStrings.termsConditions,
        child: TermsConditionScreen(),
        subtitle: AppImages.termConditionsBlue,
        description: AppImages.termConditionsGrey),
    CommonModel(
        title: AppStrings.logout,
        subtitle: AppImages.logoutRed,
        description: AppImages.logoutRed),
  ];

  getCourses() async {
    try {
      var response = await GetRequests.getCourses();
      if (response != null) {
        if (response.success) {
          courses.assignAll(response.data ?? []);

          return response.message ?? "";
        }
      } else {
        throw AppAlerts.error(response?.message ?? '');
      }
    } catch (e) {
      rethrow;
    }
  }

  getEvents() async {
    try {
      var response = await GetRequests.getEvents();
      if (response?.success == true) {
        events.assignAll(response?.data ?? []);
        return response?.message ?? "";
      } else {
        throw response?.message ?? '';
      }
    } catch (e) {
      rethrow;
    }
  }
  RxBool helpEr = RxBool(false);
   Future<String> needHelp() async {
    try {
      helpLoader.value = true;
      Map<String, String> requestBody = {
        'course_id': courseId.toString(),
        'message': messageCtrl.text,
      };
      AppUtils.log('$requestBody----response---');
      var response = await PostRequests.needHelp(requestBody);
      if (response?.success == true) {
        return response?.message ?? '';
      } else {
        helpLoader.value = false;
        throw  AppAlerts.error(response?.message ?? '');
      }
    } catch (e) {
      helpLoader.value = false;
      rethrow;
    }
  }

  getBanners() async {
    try {
      bannerLoading.value = true;
      var response = await GetRequests.getBanners();
      if (response?.success == true) {
        banners.assignAll(response?.data ?? []);
        bannerLoading.value = false;
      } else {
        return response?.message ?? '';
      }
    } catch (e) {
      bannerLoading.value = false;
      rethrow;
    }
  }
}
