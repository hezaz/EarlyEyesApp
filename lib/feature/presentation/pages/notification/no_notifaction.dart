import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/appBar2.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class NoNotifaction extends StatelessWidget {
  const NoNotifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppStrings.notification,
          style: 20.txtMediumBlue,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: 236,
              width: 300,
              child: ImageView(
                url: AppImages.nonotification,
                fit: BoxFit.cover,
              ),
            ),
          ),
          TextView(
            text: AppStrings.nonotifications,
            style: 15.txtRegularBlack,
            margin: EdgeInsets.only(top: 50),
          ),
        ],
      ),

    );
  }
}
