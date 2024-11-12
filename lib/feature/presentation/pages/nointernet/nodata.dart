import 'package:early_eyes/components/coreComponents/AppButton.dart';
import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class Nodata extends StatelessWidget {
  const Nodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ImageView(url: AppImages.nodata,
              height: 200,
              width: 200,
            ),
          ),
          TextView(text: AppStrings.nodata,
            style: 22.txtMediumBlack,
            margin: EdgeInsets.only(top: 70),
          ),

          TextView(text: AppStrings.checkyourdata,
            style: 17.txtRegularBlack,
            textAlign: TextAlign.center,
            margin: EdgeInsets.only(top: 30,bottom: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: AppButton(
              label: AppStrings.tryagain,
              labelStyle:  16.txtMediumBlack,
              prefix:  Padding(
                padding: const EdgeInsets.only(top: 3.5,right: 10),
                child: ImageView(url: AppImages.loading,size: 20,),
              ),
              buttonBorderColor: AppColors.darkBlue,
              radius: 5,
              height: 50,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
