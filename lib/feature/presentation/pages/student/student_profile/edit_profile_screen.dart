import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/coreComponents/app_date_picker.dart';
import '../../../../../components/coreComponents/common_toast.dart';
import '../../../../../components/coreComponents/editProfileImage.dart';
import '../../../../../components/coreComponents/underline_text.dart';
import '../../../../controller/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ctrl = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    onCreate();
  }

 onCreate() {
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
              Obx(
                () => EditProfileImage(
                    onChange: controller.parentImage,
                    isEditable: true,
                    radius: 100,
                    size: 95,
                    borderRadius: 100,
                    imageData: controller.parentImageCtrl),
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 32),
                  text: AppStrings.fullName,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  controller: controller.nameCtrl,
                  hint: '${Preferences.user?.fullName.toString()}'),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.email,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  marginBottom: 26,
                  controller: controller.emailCtrl,
                  hint: '${Preferences.user?.email.toString()}'),
              UnderLineTxt(txt: AppStrings.personalDetails),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 32),
                  text: AppStrings.gender,
                  style: 14.txtRegularDBlue),
              GetX<ProfileController>(
                builder: (controller) {
                  Logger().d('------on listening gender ${controller.selectGender.value}');
                  return AppDropDown<String>.singleSelect(
                    borderColor: AppColors.darkBlue.withOpacity(0.8),
                    radius: 5,
                    hint: 'Gender',
                    list: controller.gender,
                    selectedValue: controller.selectGender.value,
                    singleValueBuilder: (value) => value,
                    itemBuilder: (value) => value,
                    onSingleChange: controller.selectedGender,
                  );
                }
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 18),
                  text: AppStrings.dateOfBirth,
                  style: 14.txtRegularDBlue),
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
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 18),
                  text: AppStrings.className,
                  style: 14.txtRegularDBlue),
              GetX<ProfileController>(
                builder: (controller) {
                  return   AppDropDown<String>.singleSelect(
                  borderColor: AppColors.darkBlue.withOpacity(0.8),
                  radius: 5,
                  hint: AppStrings.selectClass,
                    list: controller.classList,
                  selectedValue: controller.selectClass.value,
                  singleValueBuilder: (value) => value,
                  itemBuilder: (value) => value,
                  onSingleChange: controller.selectedClass,
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
                hint: AppStrings.experience,
                list: controller.experience,
                selectedValue: controller.selectExp.value,
                singleValueBuilder: (value) => value,
                itemBuilder: (value) => value,
                onSingleChange: controller.selectedExp,
              ),
              CommonInputField(
                  maxLines: 4,
                  marginTop: 20,
                  controller: controller.cmtCtrl,
                  hint: Preferences.user?.userDetails?.comment != null
                      ? '${Preferences.user?.userDetails?.comment}'
                      : AppStrings.addComment),


              CommonButton(
                  isLoading: controller.studentLoader,
                  margin: const EdgeInsets.only(
                      left: 32, right: 32, top: 50, bottom: 24),
                  text: AppStrings.saveChanges,
                  clickAction: () {
                    controller.updateStudentInfo().then((value) {
                      context.pop();
                      controller.getProfile.refresh();
                      controller.userProfile.refresh();
                      CommonToast.show(msg: value);
                    });
                  })
            ],

        ));
      },
    );
  }
}
