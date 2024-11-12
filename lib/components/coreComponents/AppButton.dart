import 'package:early_eyes/components/coreComponents/appBar2.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import '../styles/appColors.dart';
import 'TapWidget.dart';
import 'TextView.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final Function()? onTap;
  final double? radius;
  final Color? buttonColor;
  final Color? buttonBorderColor; // Added: Border color property
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isFilledButton;
  final Widget? child;
  final Widget? prefix;
  final Widget? suffix;
  final Alignment alignment;
  final double? width;  // Width property
  final double? height; // Height property

  const AppButton({
    super.key,
    this.label,
    this.onTap,
    this.radius,
    this.labelStyle,
    this.buttonColor,
    this.buttonBorderColor, // Accept border color
    this.padding,
    this.margin,
    this.isFilledButton = true,
    this.child,
    this.prefix,
    this.suffix,
    this.alignment = Alignment.center,
    this.width,  // Accepting width as a parameter
    this.height, // Accepting height as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Stack(
        children: [
          Align(
            alignment: alignment,
            child: Container(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: width ?? (isFilledButton ? double.maxFinite : null),
              height: height,
              decoration: BoxDecoration(
                color: buttonColor ?? AppColors.white,
                borderRadius: BorderRadius.circular(radius ?? 10),
                border: Border.all( // Add border property
                  color: buttonBorderColor ?? Colors.transparent, // Default to transparent if no color provided
                  width: 1, // Set the border width (adjust as needed)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null) prefix!,
                  if (label != null) TextView(
                    text: label ?? '',
                    style: labelStyle ?? 14.txtMediumWhite,
                  ),
                  if (suffix != null) suffix!,
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: TapWidget(onTap: onTap),
          ),
        ],
      ),
    );
  }
}
