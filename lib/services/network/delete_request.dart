import 'package:early_eyes/services/network/remote_services.dart';

import '../../feature/data/models/requestModels/delete_child_res_model.dart';
import 'ApiUrls.dart';

class DeleteRequests {
  DeleteRequests._();

  static Future<DeleteChildResModel?> deleteChild(String id) async {
    var apiResponse = await RemoteService.simpleDelete(
        '${ApiUrls.deleteChild}$id');
    if (apiResponse != null) {
      return deleteChildResModelFromJson(apiResponse.response!);
    } else {
      return null;
    }
  }
}