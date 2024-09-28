// import 'package:flutter/material.dart';
//
// import '../../feature/data/models/dataModels/image_data_model.dart';
// import '../styles/appColors.dart';
// import '../styles/appImages.dart';
// import 'ImageView.dart';
//
// class EditImage extends StatelessWidget {
//   EditImage({super.key,required this.imageData});
//   final ImageDataModel imageData;
//   @override
//   Widget build(BuildContext context) {
//     return  ImageView(
//       radius: 16,
//       hasBorder: true,
//       borderColor: AppColors.darkBlue,
//       bgColor: AppColors.white,
//       url: imageData.type == ImageType.network
//           ? imageData.network!
//           : imageData.type == ImageType.file
//           ? imageData.file!
//           : AppImages.profile,
//       size: size,
//       //  radius: size / 2,
//       fit: BoxFit.cover,
//       imageType: imageData.type,
//     );
//   }
// }
