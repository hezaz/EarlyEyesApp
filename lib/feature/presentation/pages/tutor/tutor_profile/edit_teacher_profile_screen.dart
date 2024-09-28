import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/coreComponents/app_date_picker.dart';
import '../../../../../components/coreComponents/common_button.dart';
import '../../../../../components/coreComponents/common_input_field.dart';
import '../../../../../components/coreComponents/common_toast.dart';
import '../../../../../components/coreComponents/editProfileImage.dart';
import '../../../../../components/coreComponents/underline_text.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../../services/prefrences/prefrences.dart';
import '../../../../controller/profile_controller.dart';


class EditTeacherProfileScreen extends StatefulWidget {
 EditTeacherProfileScreen({super.key});

  @override
  State<EditTeacherProfileScreen> createState() => _EditTeacherProfileScreenState();
}

class _EditTeacherProfileScreenState extends State<EditTeacherProfileScreen> {
  final ctrl = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    onCreate();
  }

  void onCreate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ctrl.getUserDataFromPref();
      ctrl.getProfileData();
    });
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
          onBackTap: () {
            controller.showDetails.value = false;
            context.pop();
          },
          title: AppStrings.editProfile,
          body: ListView(
            children: [
              Obx(() =>
                  EditProfileImage(
                      onChange: controller.parentImage,
                      isEditable: true,
                      radius: 18,
                      size: 95,
                      imageData: controller.parentImageCtrl
                  ),
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16),
                  text: AppStrings.fullName,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  controller: controller.nameCtrl,
                  hint: 'Enter Name'),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.email,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  controller: controller.emailCtrl,
                  hint: 'Enter Email'),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.phoneNo,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                inputType: TextInputType.number,
                maxLength: 10,
                  controller: controller.phoneCtrl,
                  hint: AppStrings.enterPhoneNo),
              TextView(
                margin: const EdgeInsets.only(left: 24,top: 16),
                text: AppStrings.dateOfBirth,
                style: 14.txtRegularDBlue,
              ),

              CommonInputField(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    selectDate(
                      context: context,
                      ctrl: controller.dobCtrl,
                      selectedDate: controller.selectedDate.value,

                    );

                  },
                  trailing: const Icon(
                    Icons.calendar_month,
                    color: AppColors.darkBlue,
                    size: 16,
                  ),
                  controller: controller.dobCtrl,
                  hint: ''),
              const SizedBox(height: 26),
              UnderLineTxt(txt: AppStrings.personalDetails),

            Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                            margin: const EdgeInsets.only(left: 16, top:32),
                            text: AppStrings.tutorEmail,
                            style: 14.txtRegularDBlue),
                        CommonInputField(
                            controller: controller.tutorCtrl,
                            hint: AppStrings.enterEmail),
                        TextView(
                            margin: const EdgeInsets.only(left: 16, top: 16),
                            text: AppStrings.gender,
                            style: 14.txtRegularDBlue),
                       GetX<ProfileController>(
                                                   builder: (controller){
                                                   return  AppDropDown<String>.singleSelect(
                         borderColor: AppColors.darkBlue.withOpacity(0.8),
                         radius: 5,
                         hint: 'Gender',
                         list: controller.gender,
                         selectedValue: controller.selectGender.value,
                         singleValueBuilder: (value) => value,
                         itemBuilder: (value) => value,
                         onSingleChange: controller.selectedGender,
                       );
                                                   },
                       ),

                        TextView(
                            margin: const EdgeInsets.only(left: 16, top: 18),
                            text: AppStrings.selectCourse,
                            style: 14.txtRegularDBlue),
                        GetX<ProfileController>(
                          builder: (controller) {
                            return AppDropDown<String>.singleSelect(
                              borderColor: AppColors.darkBlue.withOpacity(0.8),
                              radius: 5,
                              hint:  AppStrings.selectCourse,
                              list: controller.coursesList,
                              selectedValue: controller.course.value,
                              singleValueBuilder: (value) => value,
                              itemBuilder: (value) => value,
                              onSingleChange:  controller.selectedCourse,
                            );
                          },

                        ),

                        TextView(
                            margin: const EdgeInsets.only(left: 16, top: 18),
                            text: AppStrings.experience,
                            style: 14.txtRegularDBlue),
                        AppDropDown<String>.singleSelect(
                          borderColor: AppColors.darkBlue.withOpacity(0.8),
                          radius: 5,
                          hint: Preferences.user?.userDetails?.experience !=
                                  null
                              ? '${Preferences.user?.userDetails?.experience}'
                              : AppStrings.selectExperience,
                          list: controller.experience,
                          selectedValue: controller.selectExp.value,
                          singleValueBuilder: (value) => value,
                          itemBuilder: (value) => value,
                          onSingleChange:  controller.selectedExp,
                        ),
                        CommonInputField(
                            maxLines: 4,
                            marginTop: 32,
                            controller: controller.cmtCtrl,
                            hint: Preferences.user?.userDetails?.comment != null
                                ? '${Preferences.user?.userDetails?.comment}'
                                : AppStrings.addComment),
                      ],
                    ),

              CommonButton(
                isLoading: controller.parentLoader,
                  margin: const EdgeInsets.only(
                      left: 32, right: 32, top: 50, bottom: 24),
                  text: AppStrings.saveChanges,
                  clickAction: () {
                    controller.updateTeacherInfo().then((value) {
                      context.pop();
                      controller.getProfile.refresh();
                      controller.userProfile.refresh();
                      CommonToast.show(msg: value);
                    });
                  })
            ],
          ),
        );
      },
    );
  }
}
