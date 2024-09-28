import '../../../../components/coreComponents/ImageView.dart';

class ImageDataModel {
  ImageType? type;
  String? network;
  String? file;
  String? asset;

  ImageDataModel(
      { this.type,
        this.network,
        this.file,
        this.asset});
}