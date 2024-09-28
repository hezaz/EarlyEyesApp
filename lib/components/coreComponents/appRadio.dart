import 'package:flutter/material.dart';

import '../styles/appColors.dart';

class AppRadio extends StatelessWidget {
  final double size;
  final bool status;
  final Function(bool) onChange;
  const AppRadio({super.key, required this.status, required this.onChange,  this.size = 20});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: AppFonts.s20, width: AppFonts.s20,
      height: size, width: size,
      child: Radio(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, value: status ? 'radio' : '',
        groupValue: 'radio',
        fillColor: MaterialStateColor.resolveWith((states) =>
        status ? AppColors.primaryBlue :
        AppColors.greyR), activeColor: status ? AppColors.primaryBlue : AppColors.greyR, onChanged: (value) => onChange(!status)),
    ); }
}
