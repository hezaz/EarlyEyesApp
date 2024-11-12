import 'package:early_eyes/components/coreComponents/common_toast.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/coreComponents/app_date_picker.dart';
import '../../../../../components/coreComponents/common_button.dart';
import '../../../../../components/coreComponents/common_input_field.dart';
import '../../../../../components/coreComponents/editProfileImage.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../../services/prefrences/prefrences.dart';
import '../../../../controller/profile_controller.dart';

class EditParentProfileScreen extends StatefulWidget {
  const EditParentProfileScreen({super.key});

  @override
  State<EditParentProfileScreen> createState() =>
      _EditParentProfileScreenState();
}

class _EditParentProfileScreenState extends State<EditParentProfileScreen> {
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
                  margin: const EdgeInsets.only(left: 16),
                  text: AppStrings.fullName,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  controller: controller.nameCtrl,
                  hint: AppStrings.enterFullName),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.email,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                  controller: controller.emailCtrl,
                  hint: '${Preferences.user?.email.toString()}'),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.phoneNo,
                  style: 14.txtRegularDBlue),
              CommonInputField(
                maxLength: 10,
                inputType: TextInputType.number,
                  controller: controller.phoneCtrl,
                  hint: '${Preferences.user?.mobileNumber.toString()}'),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: 'Relationship to student',
                  style: 14.txtRegularDBlue),
              GetX<ProfileController >(
                builder: (controller) {
                  return AppDropDown<String>.singleSelect(
                    borderColor: AppColors.darkBlue.withOpacity(0.8),
                    radius: 5,
                    hint: 'Gender',
                    list: controller.relationList,
                    selectedValue: controller.relation.value,
                    singleValueBuilder: (value) => value,
                    itemBuilder: (value) => value,
                    onSingleChange: controller.selectRelation,
                  );
                },
              ),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 16),
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


              CommonButton(
                  isLoading: controller.parentLoader,
                  margin: const EdgeInsets.only(
                      left: 32, right: 32, top: 50, bottom: 24),
                  text: AppStrings.saveChanges,
                  clickAction: () {
                    controller.updateParentInfo().then((value) {
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
