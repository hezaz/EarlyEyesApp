//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/helpers.dart';
// import '../styles/appColors.dart';
// import '../styles/appImages.dart';
//
// class CommonImageWidget extends StatelessWidget {
//   const CommonImageWidget({
//     Key? key,
//     required this.url,
//     this.placeholder,
//     this.errorPlaceholder,
//     this.width,
//     this.height,
//     this.borderRadius,
//     this.padding,
//     this.fit,
//     this.foregroundDecoration,
//     this.showOverlay,
//   }) : super(key: key);
//
//   final String? url;
//   final String? placeholder;
//   final String? errorPlaceholder;
//   final double? width;
//   final double? height;
//   final BoxFit? fit;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final BoxDecoration? foregroundDecoration;
//   final bool? showOverlay;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       foregroundDecoration:
//       (showOverlay ?? false) ? foregroundDecoration??BoxDecoration(
//         color: AppColors.primaryBlue
//           //gradient: AppColors.gradientImgOverlay
//       ) : null,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(borderRadius ?? 0),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 spreadRadius: 6)
//           ]),
//       padding: padding ?? EdgeInsets.zero,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius ?? 0),
//         child: url == null
//             ? Image.asset(
//             width: width ?? 100,
//             height: height ?? 100,
//             fit: BoxFit.cover,
//             placeholder ?? AppImages.profile)
//             : CachedNetworkImage(
//           width: width ?? 100,
//           height: height ?? 100,
//           fit: fit ?? BoxFit.cover,
//           placeholderFadeInDuration: const Duration(milliseconds: 500),
//           imageUrl: Helpers.getCompleteUrl(url),
//           placeholder: (context, url) => placeholder == null
//               ? const SizedBox()
//               : Image.asset(
//             placeholder ?? AppImages.profile,
//             fit: BoxFit.cover,
//           ),
//           errorWidget: (context, url, error) => Image.asset(
//               errorPlaceholder ??
//                   placeholder ??
//                   AppImages.profile,
//               fit: BoxFit.cover),
//         ),
//       ),
//     );
//   }
// }
