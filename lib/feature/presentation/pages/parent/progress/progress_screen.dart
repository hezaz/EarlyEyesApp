import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/appChip.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common_scaffold_widget.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppStrings.progressReport,
      onBackTap: (){
        context.pop();
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ImageView(url: AppImages.python,
                  height: 105,
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextView(text: AppStrings.python,
                    style: 14.txtBoldDarkBlue,
                    ),
                  ),
        ]),
                  SafeArea(
                    bottom: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                        TextView(text: AppStrings.studentname,
                        style: 16.txtMediumBlack,
                          margin: EdgeInsets.only(top: 20),
                        ),
                    
                        SizedBox(height: 4),
                    
                        TextView(text: AppStrings.studentna,
                          style: 14.txtRegularGreyHint,
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.classdate,
                          style: 16.txtMediumBlack,
                        ),
                    
                        SizedBox(height: 4),
                        TextView(text: AppStrings.date,
                          style: 14.txtRegularGreyHint,
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.classnumber,
                          style: 16.txtMediumBlack,
                        ),
                        SizedBox(height: 4),
                        TextView(text: AppStrings.classnumber,
                          style: 14.txtRegularGreyHint,
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.classduration,
                          style: 16.txtMediumBlack,
                        ),
                        SizedBox(height: 4),
                        TextView(text: AppStrings.classduration,
                          style: 14.txtRegularGreyHint,
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.workshopname,
                          style: 16.txtMediumBlack,
                        ),
                        SizedBox(height: 4),
                        TextView(text: AppStrings.workshopname,
                          style: 14.txtRegularGreyHint,
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.workshopdescription,
                          style: 16.txtMediumBlack,
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: AppStrings.descr,
                            hintStyle: 15.txtRegularGreyHint,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                    
                        TextView(text: AppStrings.studentsprogress,
                          style: 16.txtMediumBlack,
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: AppStrings.progress,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            hintStyle: 15.txtRegularGreyHint,
                          ),
                        ),
                      ],
                    ),
                  ),
              
                ],
              )
          ),
      ),
      );
  }
}



