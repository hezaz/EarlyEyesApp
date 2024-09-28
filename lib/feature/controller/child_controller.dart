import 'dart:developer';
import 'package:early_eyes/services/network/get_requests.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../components/coreComponents/ImageView.dart';
import '../../services/network/ApiUrls.dart';
import '../../services/network/delete_request.dart';
import '../../services/network/post_request.dart';
import '../../utils/device_info.dart';
import '../../utils/enum.dart';
import '../data/models/dataModels/image_data_model.dart';
import '../data/models/requestModels/add_child_res_model.dart';
import '../data/models/requestModels/get_child_res_model.dart';

class ChildController extends GetxController {
  var formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final mailingCtrl = TextEditingController();
  final commentCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var addChild = Rx<AddChild?>(null);
  var validatePage = false.obs;
  var childDetails = <ChildData>[].obs;
  var deleteLoader = false.obs;
  final Rx<ImageDataModel> _imageCtrl = Rx<ImageDataModel>(ImageDataModel());

  ImageDataModel get imageCtrl => _imageCtrl.value;

  String email = "";
  var editId = "";
  var childName = "";
  var childImage = "";

  void onClearState() {
    Logger().d('----clear data ---------');
    _imageCtrl.value = ImageDataModel();
    nameCtrl.clear();
    emailCtrl.clear();
    dobCtrl.clear();
    commentCtrl.clear();
    selectClass.value = null;
    genderName.value = null;
    selectExp.value = null;
  }

  void onChangeImage(ImageDataModel data) {
    print('${imageCtrl}_imageCtrl.value');
    _imageCtrl.value = data;
    _imageCtrl.refresh();
  }

  var formattedDate = "".obs;
  var addChildLoader = false.obs;
  var childLoader = false.obs;
  var showContinueBtn = false.obs;
  AuthType authType = AuthType.register;
  Rx<String?> genderName = Rx(null);
  Rx<String?> selectExp = Rx(null);
  Rx<String?> selectClass = Rx(null);
  var parentId = Preferences.user?.id.toString();
  RxBool errorExp = RxBool(false);
  RxBool errorClass = RxBool(false);
  RxBool errorGender = RxBool(false);

  updateField() {
    errorExp.value = false;
    errorClass.value = false;
    errorGender.value = false;
  }

  throwError() {
    errorExp.value = true;
    errorClass.value = true;
    errorGender.value = true;
  }

  @override
  void onInit() {
    log("$parentId---parentId");

    getChildDetails();
    formattedDate.value =
        DateFormat('yyyy-MM-dd').format(selectedDate.value).toString();
    super.onInit();
  }

  onCreateForm(id) {
    Logger().d(id);
    Logger().d("--ID");

    final list = childDetails;
    final childId = list.indexWhere((element) => element.id == id);

    if (childId > -1) {
      final data = list[childId];
      nameCtrl.text = data.fullName ?? '';
      emailCtrl.text = data.email ?? '';
      selectClass.value = data.userDetails?.userDetailsClass ?? "";
      dobCtrl.text = DateFormat('dd-MM-yyyy')
          .format(DateTime.parse(data.userDetails!.dob.toString()));
      genderName.value = data.userDetails?.gender;
      selectExp.value = data.userDetails?.experience ?? '';
      commentCtrl.text = data.userDetails?.comment ?? '';
      imageCtrl.file = data.userDetails?.profilePic ?? '';
      onChangeImage(ImageDataModel(
          network: ApiUrls.baseUrlImage + imageCtrl.file.toString(),
          type: imageCtrl.file != null ? ImageType.network : null));
      email = data.email.toString();
      editId = data.id.toString();
      childName = data.fullName.toString();
      childImage = data.userDetails?.profilePic ?? '';
      log("$email-----email---$editId-----editId----$childName-----childName----$childImage-----");
    }
  }

  selectGender(String val) {
    errorGender.value = false;
    genderName ??= RxString('');
    genderName.value = val;
    update();
  }

  selectedExp(String val) {
    errorExp.value = false;
    selectExp ??= RxString('');
    selectExp.value = val;
    update();
  }

  selectedClass(String val) {
    errorClass.value = false;
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

  Future<String> addChildDetails() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    try {
      addChildLoader.value = true;
      Map<String, String> requestBody = {
        'full_name': nameCtrl.text.toString(),
        'email': emailCtrl.text.toString(),
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'gender': genderName.value ?? '',
        'class': selectClass.value ?? '',
        'mailing_address': mailingCtrl.text.toString(),
        'experience': selectExp.value ?? '',
        'comment': commentCtrl.text.toString(),
        'dob': dobCtrl.text,
        'parent_id': '$parentId',
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
      var response = await PostRequests.addChild(requestBody, imagesData);
      if (response?.success == true) {
        showContinueBtn.value = true;
        getChildDetails();
        childDetails.refresh();
        addChildLoader.value = false;
        return response?.message.toString() ?? '';
      } else {
        addChildLoader.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      addChildLoader.value = false;
      rethrow;
    }
  }

  getChildDetails() async {
    try {
      childLoader.value = true;
      var response = await GetRequests.getChildDetails('$parentId');
      if (response != null) {
        if (response.success) {
          childDetails.assignAll(response.data ?? []);
        }
      }
    } finally {
      childLoader.value = false;
    }
  }

  Future<String> deleteChild(String id) async {
    try {
      deleteLoader.value = true;

      var response = await DeleteRequests.deleteChild(id);
      if (response?.success == true) {
        Get.back();
        getChildDetails();
        childDetails.refresh();
        deleteLoader.value = false;
        return response?.message ?? '';
      } else {
        deleteLoader.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      deleteLoader.value = false;
      rethrow;
    }
  }

  //------------------------------------edit child------------------------------//

  var editChildLoader = false.obs;

  Future<String> editChild(id, email) async {
    try {
      editChildLoader.value = true;
      var deviceInfo = await DeviceConfig.getDeviceInfo();

      Map<String, String> requestBody = {
        'full_name': nameCtrl.text,
        'email': emailCtrl.text,
        'device_id': deviceInfo.deviceId.toString(),
        'device_token': deviceInfo.deviceToken.toString(),
        'gender': genderName.value ?? '',
        'class': selectClass.value ?? '',
        'mailing_address': Preferences.user?.userDetails?.mailingAddress ?? '',
        'experience': selectExp.value ?? '',
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
        throw AppAlerts.error(response?.message ?? '');
      }
    } catch (e) {
      editChildLoader.value = false;
      rethrow;
    }
  }
}
