
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/styles/appColors.dart';

class CommonDialogCard extends StatelessWidget {
  CommonDialogCard(
      {super.key,
      this.icon,
      this.msg,
      this.title,
      required this.negativeCallBk,
      required this.positiveCallBk,this.isLoading});

  String? icon;
  String? msg;
  String? title;
  VoidCallback negativeCallBk;
  VoidCallback positiveCallBk;
  RxBool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(icon ?? AppImages.logoutRounded, height: 45),
        TextView(
            margin: const EdgeInsets.only(top: 24),
            text: msg ?? "",
            style: 24.txtBoldDarkBlue),
        TextView(
            margin: const EdgeInsets.only(top: 24, bottom: 16),
            text: title ?? "",
            style: 16.txtMediumDBlue,
            textAlign: TextAlign.center),
        Row(
          children: [
            Expanded(
                child: CommonButton(

              height: 30,
              backgroundColor: Colors.white,
              textStyle: 14.txtMediumDBlue,
              borderColor: AppColors.darkBlue,
              margin: const EdgeInsets.only(left: 16, right: 6, top: 16),
              text: AppStrings.no,
              clickAction: negativeCallBk,
            )),
            Expanded(
                child: CommonButton(
                  isLoading: isLoading,
              textStyle: 14.txtMediumWhite,
              backgroundColor: AppColors.red,
              height: 30,
              margin:  const EdgeInsets.only(right: 16, left: 6, top: 16),
              text: AppStrings.yes,
              clickAction: positiveCallBk,
            ))
          ],
        )
      ],
    );
  }
}
