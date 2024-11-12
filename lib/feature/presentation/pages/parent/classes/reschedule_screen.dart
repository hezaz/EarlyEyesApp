import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/ImageView.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/appImages.dart';
import '../../../widgets/common_card.dart';

class RescheduleScreen extends StatelessWidget {
  RescheduleScreen({super.key});

  var days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ].obs;
  var time = [
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
  ].obs;
  RxString? selectDays;
  RxString? selectTime;

  void selectedDays(value) {
    selectDays ??= RxString("");
    selectDays?.value = value;
  }

  void selectedTime(value) {
    selectTime ??= RxString("");
    selectTime?.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      onBackTap: () {
        context.pop();
      },
      title: AppStrings.classes,
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CommonCard(
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageView(url: AppImages.test3),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(text: 'ARDUINO', style: 14.txtBoldDarkBlue),
                      TextView(
                        text: 'Class 24',
                        style: 12.txtRegularGreyHint,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                      ),
                      TextView(
                          text: 'Thursday 27th at 5pm',
                          style: 12.txtRegularDBlue),
                    ],
                  ))
                ],
              ),
            ),
            const TextView(
                margin: EdgeInsets.only(left: 16, top: 32),
                text: AppStrings.selectDay),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              // height: 45,
              child: AppDropDown<String>.singleSelect(
                style: 12.txtRegularGreyHint,
                borderColor: AppColors.darkBlue.withOpacity(0.8),
                radius: 5,
                hint: AppStrings.selectDay,
                list: days,
                selectedValue: selectDays?.value,
                singleValueBuilder: (value) => value,
                itemBuilder: (value) => value,
                onSingleChange: selectedDays,
              ),
            ),
            TextView(
                margin: EdgeInsets.only(left: 16, top:context.getHeight/25),
                text: AppStrings.addTime),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              // height: 45,
              child: AppDropDown<String>.singleSelect(
                style: 12.txtRegularGreyHint,
                icon: Image.asset(AppImages.clock, height: 22),
                borderColor: AppColors.darkBlue.withOpacity(0.8),
                radius: 5,
                hint: AppStrings.addTime,
                list: time,
                selectedValue: selectTime?.value,
                singleValueBuilder: (value) => value,
                itemBuilder: (value) => value,
                onSingleChange: selectedTime,
              ),
            ),
            const Spacer(),
            CommonButton(

                margin: EdgeInsets.only(bottom: context.getHeight/25,left: 16,right: 16),
                text: AppStrings.saveChanges, clickAction: (){})
          ],
        ),
      ),
    );
  }
}
