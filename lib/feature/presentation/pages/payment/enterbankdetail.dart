import 'package:early_eyes/components/coreComponents/AppButton.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class Enterbankdetail extends StatelessWidget {
  const Enterbankdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Payment'),
        titleTextStyle: 20.txtMediumBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primaryBlue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: TextView(
                  text: AppStrings.enterbankdetails,
                  style: 17.txtMediumDBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    TextView(
                      text: AppStrings.termsandcondations,
                      style: 11.txtMediumDBlue,
                    ),
                    TextView(
                      text: AppStrings.terms,
                      style: 11.txtRegularPBlue,
                    ),
                  ],
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 15, top: 20),
                text: AppStrings.accno,
                style: 12.txtRegularDBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CommonInputField(
                  hintStyle: 10.txtRegularGreyHint,
                  hint: AppStrings.enteraccno,
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 15, top: 20),
                text: AppStrings.reenteraccno,
                style: 12.txtRegularDBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CommonInputField(
                  hintStyle: 10.txtRegularGreyHint,
                  hint: AppStrings.enteraccno,
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 15, top: 20),
                text: AppStrings.ifsccode,
                style: 12.txtRegularDBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CommonInputField(
                  hintStyle: 10.txtRegularGreyHint,
                  hint: AppStrings.enterifsccode,
                  trailing: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextView(
                      text: AppStrings.findifsc,
                      style: 10.txtRegularPBlue,
                    ),
                  ),
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
                text: AppStrings.accholdername,
                style: 12.txtRegularDBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CommonInputField(
                  hintStyle: 10.txtRegularGreyHint,
                  hint: AppStrings.entername,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                child: CommonButton(
                  margin: EdgeInsets.only(top: 10),
                  text: AppStrings.submit,
                  clickAction: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
