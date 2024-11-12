import 'package:early_eyes/components/coreComponents/AppButton.dart';
import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class SkipChild extends StatelessWidget {
  const SkipChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Row(
              children: [
                ImageView(url: AppImages.backBtn, size: 24),
                const Spacer(),
                TextView(
                  text: AppStrings.addChild,
                  style: 20.txtMediumprimaryblue,
                ),
                const Spacer(),
                TextView(
                  text: AppStrings.skip,
                  style: 20.txtMediumprimaryblue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: ImageView(
              url: AppImages.child,
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 40),
          TextView(
            text: AppStrings.descriptionofskip,
            style: 17.txtRegularBlack,
            textAlign: TextAlign.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
            child: AppButton(
              label: AppStrings.addChild,
              labelStyle: 16.txtMediumWhite,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              buttonColor: AppColors.primaryBlue,
              radius: 5,
              height: 50,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
