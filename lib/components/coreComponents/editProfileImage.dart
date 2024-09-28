import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../feature/data/models/dataModels/image_data_model.dart';
import '../styles/appColors.dart';
import '../styles/appImages.dart';
import 'ImageView.dart';
import 'TapWidget.dart';
import 'TextView.dart';
import 'appBSheet.dart';

class EditProfileImage extends StatelessWidget {
  final double size;
  final ImageDataModel imageData;
  final Function(ImageDataModel)? onChange;
  final bool isEditable;
  final EdgeInsets? margin;
  final String? error;
  final double? radius;
  final double? borderRadius;

  const EditProfileImage(
      {super.key,
      required this.size,
      required this.imageData,
      this.onChange,
      this.isEditable = true,
      this.margin,
      this.radius,
        this.borderRadius,
      this.error = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        children: [
          Stack(
            children: [
              ImageView(
                borderRadius: borderRadius ?? 22,
                radius: radius ?? 16,
                hasBorder: true,
                borderColor: AppColors.darkBlue,
                bgColor: AppColors.white,
                url: imageData.type == ImageType.network
                    ? imageData.network!
                    : imageData.type == ImageType.file
                        ? imageData.file.toString()
                        : AppImages.profile,
                size: size,
                //  radius: size / 2,
                fit: BoxFit.fill,
                imageType: imageData.type,
              ),
              Visibility(
                visible: isEditable,
                child: Positioned(
                    right: 30,
                    bottom: 0,
                    child: ImageEditButton(
                      size: 32,
                      onTap: () {
                        appBSheet(context, EditImageBSheetView(
                          onItemTap: (source) async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? image =
                                await picker.pickImage(source: source);
                            if (image != null) {
                              ImageDataModel imageDataTemp = imageData;
                              imageDataTemp.file = image.path;
                              imageDataTemp.type = ImageType.file;
                              if (onChange != null) {
                                onChange!(imageDataTemp);
                              }
                            }
                          },
                        ));
                      },
                    )),
              )
            ],
          ),
          Visibility(
              visible: error != null && error!.isNotEmpty,
              child: TextView(
                text: error ?? '',
                style: 14.txtRegularError,
                margin: const EdgeInsets.only(top: 7),
              ))
        ],
      ),
    );
  }
}

class ImageEditButton extends StatelessWidget {
  final double size;
  final Function()? onTap;

  const ImageEditButton({super.key, required this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 17,
          ),
          // child: const ImageView(
          //   url: AppIcons.editCamera,
          // ),
        ),
        Positioned.fill(
            child: TapWidget(
          onTap: onTap,
        ))
      ],
    );
  }
}

class EditImageBSheetView extends StatelessWidget {
  final Function(ImageSource) onItemTap;

  const EditImageBSheetView({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    // final locale = context.locale;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                margin: EdgeInsets.zero,
                text: "Choose Photo",
                style: 22.txtBoldBlack,
              ),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close, color: AppColors.black))
            ],
          ),

          Row(
            children: [
              _ItemTile(
                  onTap: () => onItemTap(ImageSource.camera),
                  icon: Icon(Icons.camera_alt_outlined,
                      size: 50, color: AppColors.darkBlue.withOpacity(0.5)),
                  name: "Camera"),
              const SizedBox(
                width: 20,
              ),
              _ItemTile(
                  onTap: () => onItemTap(ImageSource.gallery),
                  image: AppImages.gallery,
                  name: "Gallery"),
            ],
          )
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  final String? image;
  final String name;
  final Function()? onTap;
  Widget? icon;

  _ItemTile({super.key, this.image, required this.name, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: icon ??
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Image.asset(image ?? ""),
                    ),
              ),
              TextView(
                margin: const EdgeInsets.only(top: 8),
                text: name,
                style: 14.txtMediumGrey,
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: TapWidget(
          onTap: onTap,
        ))
      ],
    );
  }
}
