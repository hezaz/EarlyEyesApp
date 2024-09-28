import 'dart:ui';

import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../styles/appColors.dart';

class CommonInputField extends StatelessWidget {
  String? hint;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextInputType? inputType;
  double? marginLeft;
  double? marginRight;
  double? marginTop;
  double? marginBottom;
  Widget? leading;
  Widget? trailing;
  List<TextInputFormatter>? inputFormatter;
  TextCapitalization? textCapitalization;
  String? errorText;
  bool? isEnable;
  RxBool? isShowTrailing;
  Color? fillColor;
  Color? borderColor;
  int? maxLines;
  FocusNode? focusNode;
  bool? autoFocus;
  bool? obscure;
  double? height;
  int? maxLength;
  VoidCallback? onTap;
  bool? selectionPoint;
  TextStyle? hintStyle;

  TextInputAction? textInputAction;
  OutlineInputBorder? underLineBorder;
  EdgeInsets? edgesInsects;

  var inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColors.darkBlue));
  var errorInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: Colors.red));

  CommonInputField({
    Key? key,
    required this.controller,
    this.hint,
    this.onChanged,
    this.validator,
    this.inputType,
    this.inputFormatter,
    this.marginLeft,
    this.marginRight,
    this.marginTop,
    this.marginBottom,
    this.leading,
    this.trailing,
    this.textCapitalization,
    this.errorText,
    this.isEnable,
    this.isShowTrailing,
    this.fillColor,
    this.borderColor,
    this.maxLines,
    this.focusNode,
    this.onFieldSubmitted,
    this.autoFocus,
    this.underLineBorder,
    this.edgesInsects,
    this.obscure = false,
    this.height,
    this.textInputAction,
    this.maxLength,
    this.onTap,
    this.selectionPoint,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      //color: Colors.pink,
      margin: EdgeInsets.only(
          left: marginLeft ?? 16,
          right: marginRight ?? 16,
          top: marginTop ?? 8,
          bottom: marginBottom ?? 8),
      child: TextFormField(
        onTapOutside: (event) {

          FocusManager.instance.primaryFocus?.unfocus();

        },


        onTap: onTap,
        maxLength: maxLength,

        obscuringCharacter: "*",
        enabled: isEnable ?? true,
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        style: 12.txtRegularBlack,
        keyboardType: inputType ?? TextInputType.text,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        cursorColor: AppColors.primaryBlue,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        contextMenuBuilder: (context, editableTextState) {
          return Container(height: 0, color: Colors.transparent);
        },
        decoration: InputDecoration(
            counterText: "",
            hintText: hint ?? "",
            hintStyle: hintStyle ?? 13.txtRegularGreyText,
            fillColor: fillColor ?? Colors.white,
            filled: true,
            errorText: errorText,
            prefixIcon: leading,
            suffixIcon: trailing,
            //isShowTrailing?.value ?? RxBool(false).value ? trailing : null,
            border: underLineBorder ?? inputBorder,
            errorBorder: underLineBorder ?? inputBorder,
            enabledBorder: underLineBorder ?? inputBorder,
            disabledBorder: underLineBorder ?? inputBorder,
            focusedBorder: underLineBorder ?? inputBorder,
            focusedErrorBorder: underLineBorder ?? inputBorder,
            errorStyle: 12.txtRegularError,
            contentPadding: edgesInsects ??
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
        inputFormatters: inputFormatter,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
