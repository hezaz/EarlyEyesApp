
import 'package:early_eyes/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

extension TextStyles on num{



  TextStyle get txtRegularWhite => _textStyle(this,AppColors.white,Family.regular);
  TextStyle get txtRegularBlack => _textStyle(this,AppColors.black,Family.regular);
  TextStyle get txtRegularLBlack => _textStyle(this,AppColors.blue34,Family.regular);
  TextStyle get txtRegularError => _textStyle(this,AppColors.red,Family.regular);
  TextStyle get txtRegularBlackText => _textStyle(this,AppColors.blackText,Family.regular);
  TextStyle get txtRegularPBlue => _textStyle(this,AppColors.primaryBlue,Family.regular);
  TextStyle get txtRegularGreyText => _textStyle(this,AppColors.greyText,Family.regular);
  TextStyle get txtRegularGreyHint => _textStyle(this,AppColors.greyHint,Family.regular);
  TextStyle get txtRegularDBlue => _textStyle(this,AppColors.darkBlue,Family.regular);




 //medium
  TextStyle get txtMediumWhite => _textStyle(this,AppColors.white,Family.medium);
  TextStyle get txtMediumPBlue => _textStyle(this,AppColors.primaryBlue,Family.medium);
  TextStyle get txtMediumBlue => _textStyle(this,AppColors.primaryBlue,Family.medium);
  TextStyle get txtMediumDBlue => _textStyle(this,AppColors.darkBlue,Family.medium);
  TextStyle get txtMediumBlack => _textStyle(this,AppColors.black,Family.medium);
  TextStyle get txtMediumprimaryblue => _textStyle(this,AppColors.primaryBlue,Family.medium);
  TextStyle get txtMediumLBlack => _textStyle(this,AppColors.blue34,Family.medium);
  TextStyle get txtMediumGrey => _textStyle(this,AppColors.grey76,Family.medium);

  //Semi bold
  TextStyle get txtSBoldBlackText => _textStyle(this,AppColors.blackText,Family.semiBold);
  TextStyle get txtSBoldGreyText => _textStyle(this,AppColors.greyText,Family.semiBold);
  TextStyle get txtSBoldPBlueText => _textStyle(this,AppColors.primaryBlue,Family.semiBold);
  TextStyle get txtSBoldBlack => _textStyle(this,AppColors.black,Family.semiBold);
  TextStyle get txtSBoldDarkBlue => _textStyle(this,AppColors.darkBlue,Family.semiBold);



  //bold
  TextStyle get txtBoldWhite => _textStyle(this,AppColors.white,Family.bold);
  TextStyle get txtBoldBlack => _textStyle(this,AppColors.black,Family.bold);
  TextStyle get txtBoldDarkBlue => _textStyle(this,AppColors.darkBlue,Family.bold);
  TextStyle get txtBoldPBlue => _textStyle(this,AppColors.primaryBlue,Family.bold);

}













TextStyle _textStyle(num size, color, family) => TextStyle(
     fontSize: size.numToDouble,
    color: color,
    fontFamily: family
  );
class Family{
  static const String light = ' Poppins-Light';
  static const String regular = 'Poppins-Regular';
  static const String medium = 'Poppins-Medium';
  static const String semiBold = ' Poppins-SemiBold';
  static const String bold = 'Poppins-Bold';
  static const String extraBold = 'Poppins-ExtraBold';
}