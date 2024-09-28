import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class CommonTabCard extends StatelessWidget {
   CommonTabCard({super.key,this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child:  Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: CircleAvatar(
          backgroundColor: AppColors.greyD4,
          radius: 16,
          child: Text(text ?? "",style: 14.txtMediumWhite),
        ),
      ),
    );
  }
}
