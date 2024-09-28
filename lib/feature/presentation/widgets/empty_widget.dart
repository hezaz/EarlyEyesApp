import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/styles/app_strings.dart';

class EmptyWidget extends StatelessWidget {
  EmptyWidget({super.key,this.image,this.title,this.height,this.style,this.margin});
String? image;
String? title;
TextStyle? style;
double? height;
EdgeInsets? margin;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Image.asset(image ??  AppImages.emptyChild,height:height ?? 250),
         TextView(
           textAlign: TextAlign.center,
             margin: margin ??  const EdgeInsets.only(top: 24,bottom: 16,left: 16,right: 16),
             text: title ?? AppStrings.emptyChild,style: style ??    16.txtRegularDBlue),
      ],

    );
  }
}
