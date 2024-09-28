// import 'package:early_eyes/components/styles/textStyles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../styles/appColors.dart';
// import '../styles/decoration.dart';
// import 'TextView.dart';
//
// class EditText extends StatefulWidget {
//   final TextEditingController controller;
//   final bool? readOnly;
//   final EdgeInsets? padding;
//   final EdgeInsets? margin;
//   final double? radius;
//   final Color? borderColor;
//   final Color? filledColor;
//   final bool isFilled;
//   final String? hint;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final String? label;
//   final TextStyle? labelStyle;
//   final TextInputType? inputType;
//   final int noOfLines;
//   final String? suffixText;
//   final TextStyle? suffixTextStyle;
//   final Widget? prefixIcon;
//   final TextAlign? textAlign;
//   final int? maxLength;
//   final Function(String)? onChange;
//   final FocusNode? node;
//   final Widget? suffixIcon;
//   final Widget? suffix;
//   final List<TextInputFormatter>? inputFormat;
//   final String? error;
//   final BoxConstraints? prefixIconConstraints;
//   final Function()? onTap;
//
//   const EditText(
//       {super.key,
//       required this.controller,
//       this.readOnly,
//       this.padding,
//       this.margin,
//       this.radius,
//       this.borderColor,
//       this.filledColor,
//       this.isFilled = false,
//       this.hint,
//       this.hintStyle,
//       this.textStyle,
//       this.label,
//       this.labelStyle,
//       this.inputType,
//       this.noOfLines = 1,
//       this.suffixText,
//       this.suffixTextStyle,
//       this.prefixIcon,
//       this.textAlign,
//       this.maxLength,
//       this.onChange,
//       this.node,
//       this.suffixIcon,
//       this.suffix,
//       this.inputFormat,
//       this.error, this.onTap, this.prefixIconConstraints});
//
//   @override
//   State<EditText> createState() => _EditTextState();
// }
//
// class _EditTextState extends State<EditText> {
//   @override
//   Widget build(BuildContext context) {
//     final borderStyle = AppDecoration.inputBorder(
//         borderColor: widget.borderColor, radius: widget.radius);
//
//     return Padding(
//       padding: widget.margin ?? EdgeInsets.zero,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Visibility(
//               visible: widget.label != null,
//               child: TextView(
//                 text: widget.label ?? '',
//                 style: 12.txtSBoldBlackText,
//                 margin: const EdgeInsets.only(bottom: 4),
//               )),
//           TextField(
//             onTap: widget.onTap,
//             focusNode: widget.node,
//             style: widget.textStyle ?? 14.txtRegularBlackText,
//             textAlign: widget.textAlign ?? TextAlign.start,
//             inputFormatters: widget.inputFormat,
//             onTapOutside: (event)=> FocusScope.of(context).unfocus(),
//             decoration: InputDecoration(
//                 isDense: true,
//                 hintText: widget.hint,
//                 hintStyle: widget.hintStyle ?? 14.txtRegularGreyHint,
//                 filled: widget.isFilled,
//                 fillColor: widget.filledColor ??
//                     // AppColors.greySemiDarkGreyText
//                     AppColors.white,
//                 enabledBorder: borderStyle,
//                 border: borderStyle,
//                 focusedBorder: borderStyle,
//                 suffixStyle: widget.suffixTextStyle,
//                 suffixText: widget.suffixText,
//                 suffixIcon: widget.suffixIcon,
//                 suffix: widget.suffix,
//                 prefixIcon: widget.prefixIcon,
//                 contentPadding: widget.padding,
//                 prefixIconConstraints:   widget.prefixIconConstraints,
//                 errorText: widget.error?.isNotEmpty == true ? widget.error : null
//             ),
//             maxLength: widget.maxLength,
//             minLines: widget.noOfLines,
//             maxLines: widget.noOfLines,
//             keyboardType: widget.inputType,
//             readOnly: widget.readOnly ?? false,
//             controller: widget.controller,
//             onChanged: widget.onChange,
//
//             buildCounter: (context,
//                     {required currentLength,
//                     required isFocused,
//                     required maxLength}) =>
//                 const SizedBox.shrink(),
//           ),
//         ],
//       ),
//     );
//   }
// }
