import 'package:early_eyes/feature/controller/child_controller.dart';
import 'package:early_eyes/services/network/ApiUrls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../components/coreComponents/ImageView.dart';
import '../../services/network/post_request.dart';
import '../../services/prefrences/prefrences.dart';
import '../../utils/device_info.dart';
import '../data/models/dataModels/image_data_model.dart';

class EditChildCtrl extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final mailingCtrl = TextEditingController();
  final commentCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  var selectedDate = DateTime.now().obs;

  Rx<String?> course = Rx(null);
  Rx<String?> gender = Rx(null);
  Rx<String?> selectExp = Rx(null);
  Rx<String?> selectClass = Rx(null);
  Rx<String?> relation = Rx(null);

  String name = "";
  String id = "";
  String email = "";
  String exp = "";
  String classname = "";
  String dob = "";
  String genderName = "";
  String? note = "";
  String? image = "";



  var formattedDate = "".obs;

  @override
  onInit() {
    super.onInit();
    getArguments();
    initCtrl();
    formattedDate.value =
        DateFormat('yyyy-MM-dd').format(selectedDate.value).toString();
  }

  getArguments() {
    Map<String, dynamic>? data = Get.arguments;
    if (data != null) {
      id = data["id"];
      name = data["name"];
      email = data["email"];
      exp = data["experience"];
      classname = data["class"];
      dob = data["dob"];
      genderName = data["gender"];
      note = data["note"];
      image = data["image"];
    }
  }

  initCtrl() {
    print('${image}image');
    print('${imageCtrl.file}image2');
    emailCtrl.text = email;
    nameCtrl.text = name;
    selectExp.value = exp;
    selectClass.value = classname;
    commentCtrl.text = (note ?? "") ;
    gender.value = genderName;
    dobCtrl.text = dob;
    image = image ?? '';
  }

  selectGender(String val) {
    gender ??= RxString('');
    gender.value = val;
    update();
  }

  selectedExp(String val) {
    selectExp ??= RxString('');
    selectExp.value = val;
    update();
  }

  selectedClass(String val) {
    selectClass ??= RxString('');
    selectClass.value = val;
    update();
  }

  var genderList = ['Male', 'Female'].obs;
  var experience = [
    "Fresher",
    "Internships",
    "Experienced",
    "Intermediate",
  ].obs;
  var classList = [
    "CP",
    "CE1",
    "CE2",
    "CM1",
    "CM2",
    "6ème",
    "5ème",
    "4ème",
    "3ème",
    "2nde",
    "1ère",
    "Terminale"
  ].obs;
  final Rx<ImageDataModel> _imageCtrl = Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get imageCtrl => _imageCtrl.value;


  void onChangeImage(ImageDataModel data) {
    print('${imageCtrl}_imageCtrl.value');
    _imageCtrl.value = data;
    _imageCtrl.refresh();
  }


  getProfileData() {
    emailCtrl.text = email;
    nameCtrl.text = name;
    selectExp.value = exp;
    selectClass.value = classname;
    commentCtrl.text =  (note ?? "") ;
    gender.value = genderName;
    dobCtrl.text = dob;


    Logger().d('genderValue ....$genderName');
    Logger().d('genderValue1 ....${gender.value}');
    dobCtrl.text = DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(Preferences.user!.userDetails!.dob.toString()));
    onChangeImage(ImageDataModel(
        network: ApiUrls.baseUrlImage + image.toString(),
        type: image != null ? ImageType.network : null));
  }
  var editChildLoader = false.obs;
  Future<String> editChild(String id, String email) async {
    try {
      var deviceInfo = await DeviceConfig.getDeviceInfo();
      editChildLoader.value = true;
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text,
        'email': emailCtrl.text,
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'gender': gender.value ?? '',
        'class': selectClass.value ?? '',
        'mailing_address':Preferences.user?.userDetails?.mailingAddress ?? '',
        'experience':  selectExp.value ?? '',
        'comment': commentCtrl.text,
        'dob': dobCtrl.text,
        'child_id': id,
      };
      http.MultipartFile? uploadMedia;
      if (imageCtrl.file != null) {
        uploadMedia = await http.MultipartFile.fromPath(
            'image', imageCtrl.file.toString());
      }
      Map<String, dynamic>? imagesData;
      if (imageCtrl.file != null) {
        imagesData = {'profile_pic': imageCtrl.file};
      }
      var response = await PostRequests.editChild(requestBody, imagesData);
      if (response?.success == true) {
        Get.put(ChildController()).getChildDetails();
        Get.put(ChildController()).childDetails.refresh();
        return response?.message ?? '';
      } else {
        editChildLoader.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      editChildLoader.value = false;
      rethrow;
    }
  }
}
