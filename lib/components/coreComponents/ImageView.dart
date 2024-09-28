import 'dart:io';
import 'package:flutter/material.dart';
import '../../services/network/ApiUrls.dart';
import '../styles/appColors.dart';
import 'TapWidget.dart';

enum ImageType { asset, file, network }

class ImageView extends StatelessWidget {
  final String url;
  final ImageType? imageType;
  final double? size;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;
  final double? borderRadius;
  final Color? tintColor;
  final Color? borderColor;
  final EdgeInsets? margin;
  final Function()? onTap;
  final bool hasBorder;
  final Color? bgColor;
  final double? radiusWidth;

  const ImageView(
      {super.key,
      required this.url,
      this.imageType,
      this.size,
      this.height,
      this.width,
      this.fit,
      this.onTap,
      this.radius,
      this.tintColor,
      this.margin,
      this.hasBorder = false,
      this.borderColor,
      this.bgColor,
      this.radiusWidth,
      this.borderRadius,
      });

  ImageProvider image() {
    switch (imageType) {
      case ImageType.network:
        return  NetworkImage(
           // url == ""||url=="${ApiUrls.baseUrlImage}null"
            url == ""||url=="${ApiUrls.baseUrlImage}null"
            ? "https://pinnacle.works/wp-content/uploads/2022/06/dummy-image.jpg"
            : url);
      case ImageType.file:
        return FileImage(File(url));
      default:
        return AssetImage(url);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child:
      Container(

        height: 110,
        child: Stack(
          children: [
            Container(
              height: size ?? height,
              width: size ?? width,
              decoration: BoxDecoration(


                  borderRadius: BorderRadius.circular(borderRadius ?? 22),
                  border: hasBorder
                      ? Border.all(
                          color: borderColor ?? AppColors.black,
                          width: radiusWidth ?? 2.8)
                      : null),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: Container(
                  color: imageType == ImageType.network
                      ?
                      // AppColors.greyLightBorder
                      AppColors.white
                      : null,
                  child: Image(
                    image: image(),
                    height: size ?? height,
                    width: size ?? width,
                    fit: fit,
                    color: tintColor,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
              ),
            ),
            Positioned.fill(
                child: TapWidget(
              onTap: onTap,
            ))
          ],
        ),
      ),
    );
  }
}
