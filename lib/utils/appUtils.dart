

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';


class AppUtils{
  static final ImagePicker _imagePicker = ImagePicker();
  static final Logger _log = Logger();

  static void log(var msg) =>_log.d(msg);
  static void logEr(var msg) => _log.e(msg);

  static Future<String?> imagePicker() async{
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    return image?.path;
  }

  static Future<String?> videoPicker() async{
    final XFile? galleryVideo =
        await _imagePicker.pickVideo(source: ImageSource.gallery);
    return galleryVideo?.path;
  }

  static toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        // textColor: Colors.white,
        fontSize: 16.0

    );
  }

}
