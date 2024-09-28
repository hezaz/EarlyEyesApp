

import '../../../components/constants.dart';
import '../../data/models/dataModels/responseData.dart';

abstract class CoreRepository{
  Future<ResponseData<String>> studentRegister({required MediaType type, required String path});
}