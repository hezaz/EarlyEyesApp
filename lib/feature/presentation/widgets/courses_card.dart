import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../components/coreComponents/TextView.dart';
import 'common_card.dart';

class CoursesCard extends StatelessWidget {
  CoursesCard(
      {super.key,
      this.subTitle,
      this.description,
      this.title,
      this.image,
      this.margin,
      this.onClick,
      this.width,
      this.height,this.padding});

  String? image;
  String? title;
  String? subTitle;
  String? description;
  EdgeInsets? margin;
  EdgeInsets? padding;
  VoidCallback? onClick;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: padding,
      onTap: onClick,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageView(
            radius: 18,
            size: 150,
            fit: BoxFit.cover,
            imageType: ImageType.network,
            url: image ?? '',
          ),
          TextView(
            margin: const EdgeInsets.only(left: 8,top: 8),
            text: title ?? '',
            style: 14.txtBoldDarkBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 8, top: 4),
            text: subTitle ?? '',
            style: 12.txtRegularGreyHint,
          ),
          Visibility(
            visible: description != "",
            child: TextView(
              margin:
                  const EdgeInsets.only(left: 8, top: 4, right: 8),
              text: description ?? '',
              style: 12.txtMediumDBlue,
            ),
          )
        ],
      ),
    );
  }
}
