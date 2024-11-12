import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class NoMessage extends StatelessWidget {
  const NoMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(
            AppStrings.message,
            style: 20.txtMediumDBlue,
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 150),
                    height: 216,
                    width: 300,
                    child: ImageView(
                      url: AppImages.nomessage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TextView(
                  text: AppStrings.nomessage,
                  style: 15.txtRegularBlack,
                  margin: EdgeInsets.only(top: 20),
                ),
              ],
            ),
            Positioned(
              bottom: 100.0,
              right: 35.0,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryBlue,
                ),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.add, color: AppColors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

