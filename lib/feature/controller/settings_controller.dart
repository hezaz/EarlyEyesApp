// import 'package:early_eyes/components/styles/appImages.dart';
// import 'package:early_eyes/components/styles/app_strings.dart';
// import 'package:early_eyes/feature/data/models/dataModels/common_model.dart';
// import 'package:early_eyes/services/network/get_requests.dart';
// import 'package:early_eyes/services/network/post_request.dart';
//
// import 'package:flutter/cupertino.dart';
//
// import 'package:get/get.dart';
//
// class SettingsController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   final nameCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final studentCtrl = TextEditingController();
//   final mailCtrl = TextEditingController();
//   final cmtCtrl = TextEditingController();
//   final dobCtrl = TextEditingController();
//   final nPassCtrl = TextEditingController();
//   final oPassCtrl = TextEditingController();
//   final cPassCtrl = TextEditingController();
//   final reportEmailCtrl = TextEditingController();
//   final reportTitleCtrl = TextEditingController();
//   final reportMessageCtrl = TextEditingController();
//   final projectNameCtrl = TextEditingController();
//   final descriptionCtrl = TextEditingController();
//   final urlCtrl = TextEditingController();
//
//   RxString? selectedValue;
//   RxString? selectClass;
//   RxString? selectCourse;
//   RxString? selectExperience;
//   var showDetails = false.obs;
//   RxInt selectedIndex = (-1).obs;
//
//   setIndex(int index) {
//     selectedIndex.value = index;
//   }
//
//   var accountOptions = <CommonModel>[
//     CommonModel(
//         image: AppImages.profileOutlined,
//         title: AppStrings.editProfile,
//         onTap: () {}),
//     CommonModel(
//         image: AppImages.password,
//         title: AppStrings.changePassword,
//         onTap: () {}),
//   ];
//   var supportOptions = <CommonModel>[
//     CommonModel(image: AppImages.faq, title: AppStrings.faq, onTap: () {}),
//     CommonModel(
//         image: AppImages.aboutUs, title: AppStrings.aboutUs, onTap: () {}),
//     CommonModel(
//         image: AppImages.termConditions,
//         title: AppStrings.termsConditions,
//         onTap: () {}),
//     CommonModel(
//         image: AppImages.privacyPolicy,
//         title: AppStrings.privacyPolicy,
//         onTap: () {}),
//   ];
//   var actionsOptions = <CommonModel>[
//     CommonModel(
//         image: AppImages.report, title: AppStrings.report, onTap: () {}),
//     CommonModel(
//         image: AppImages.logout, title: AppStrings.logout, onTap: () {}),
//     CommonModel(
//         image: AppImages.delete, title: AppStrings.deleteAcc, onTap: () {}),
//   ];
//
//   selectedItem(value) {
//     selectedValue?.value = value;
//   }
//
//   selectedExperience(value) {
//     selectExperience?.value = value;
//   }
//
//   selectedClass(value) {
//     selectClass?.value = value;
//   }
//
//   selectedCourse(value) {
//     selectClass?.value = value;
//   }
//
//   var items = ['male', 'female'].obs;
//   var className = ['I', 'II', 'III', 'IV', 'V'].obs;
//   var experienceDetails =
//       ['Fresher', 'Trainee', 'Experienced', 'Intermediate'].obs;
//   var courses = ['Python', 'Flutter', 'Php', 'Nodejs'].obs;
//   var termsAndConditions = <CommonModel>[
//     CommonModel(title: AppStrings.condition1, subtitle: AppStrings.condition5),
//     CommonModel(title: AppStrings.condition2, subtitle: AppStrings.condition6),
//     CommonModel(title: AppStrings.condition3, subtitle: AppStrings.condition7),
//     CommonModel(title: AppStrings.condition4, subtitle: AppStrings.condition8),
//   ];
//   var collectInformation = [
//     "Full name",
//     "Age",
//     "Date of birth",
//     "Email address",
//     "Gender",
//     "Class/grade",
//     "Tutor education and credentials",
//   ];
//   var useInformation = [
//     "Provide and improve our services",
//     "Facilitate communication between students, parents, and tutors",
//     "Monitor and analyze usage and trends to improve your experience",
//     "Process transactions and send related information",
//   ];
//   var sharingInformation = [
//     "With your consent",
//     "For processing transactions (e.g., payment processing)",
//     "To comply with legal obligations",
//   ];
//   var isLoading = false.obs;
//
//   Future<String> changePassword() async {
//     try {
//       isLoading.value = true;
//       Map<String, String> requestBody = {
//         'old_password': oPassCtrl.text.toString().trim(),
//         'new_password': nPassCtrl.text.toString().trim(),
//       };
//       var response = await PostRequests.changePassword(requestBody);
//       if(response?.success == true){
//         return response?.message ?? '';
//
//       } else {
//         isLoading.value = false;
//         throw response?.message ?? '';
//       }
//     } catch (e) {
//       isLoading.value = false;
//       rethrow;
//     }
//   }
//   Future<String> deleteAccount() async {
//    try{
//      var response = await GetRequests.deleteAccount();
//      if(response?.success == true){
//
//        return response?.message ?? "";
//
//      }else{
//        throw response?.message ?? "";
//      }
//    }catch(e){
//      rethrow;
//    }
//
//   }
// }
