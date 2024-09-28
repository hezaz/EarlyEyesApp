import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../styles/appColors.dart';

class CommonPasswordInputField extends StatefulWidget {
  String hint;
  String? errorText;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatter;
  bool? isShowHelperText;
  Widget? leading;
  FocusNode? focusNode;
  bool? autoFocus;
  TextInputAction? textInputAction;
  double? marginLeft;
  double? marginRight;
  double? marginTop;
  double? marginBottom;





  CommonPasswordInputField({
    Key? key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.validator,
    this.inputType,
    this.inputFormatter,
    this.isShowHelperText,
    this.leading,
    this.focusNode,
    this.textInputAction,
    this.autoFocus,
    this.onFieldSubmitted,
    this.errorText,
    this.marginRight,
    this.marginLeft,
    this.marginBottom,
    this.marginTop


  }) : super(key: key);

  @override
  State<CommonPasswordInputField> createState() => _CommonPasswordInputFieldState();
}

class _CommonPasswordInputFieldState extends State<CommonPasswordInputField> {
  RxBool isObscure = true.obs;

  var inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color:AppColors.darkBlue));

  var errorInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(left: widget.marginLeft ?? 16,
          right: widget.marginRight ??  16,
          top: widget.marginTop ?? 8,
          bottom: widget.marginBottom ?? 8
      ),
      child: Obx(
        ()=> TextFormField(
          onTapOutside: (event) {

            FocusManager.instance.primaryFocus?.unfocus();

          },
          controller: widget.controller,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus??false,
          textInputAction: widget.textInputAction,
          style: 12.txtRegularBlack,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: AppColors.primaryBlue,
          obscureText: isObscure.value,
          obscuringCharacter: '*',


          decoration: InputDecoration(
              hintText: widget.hint.tr,
              hintStyle: 13.txtRegularGreyText,
              prefixIcon: widget.leading,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    isObscure.value = !isObscure.value;
                  });
                  },
                  icon: Icon(isObscure.value ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.greyHint,size: 16,)),
              filled: true,
              fillColor: Colors.white,
             // helperText: isShowHelperText??true? 'message_password_helper'.tr : null,
             helperMaxLines: 2,
              helperStyle: 12.txtRegularGreyHint,
              errorText: widget.errorText,

              errorStyle: 12.txtRegularError,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              border: inputBorder,
              errorBorder: inputBorder,
              enabledBorder: inputBorder,
              disabledBorder: inputBorder,
              focusedBorder: inputBorder,
              focusedErrorBorder: inputBorder),
          inputFormatters: widget.inputFormatter,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ),
    );
  }
}
