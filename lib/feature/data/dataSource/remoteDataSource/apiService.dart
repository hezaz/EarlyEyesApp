import 'package:chopper/chopper.dart';

import '../../../../services/networking/urls.dart';

part 'apiService.chopper.dart';
@ChopperApi()
abstract class ApiService extends ChopperService {

  static ApiService create([ChopperClient? client]) => _$ApiService(client);
  @Post(path: Urls.studentRegistration)
  @Multipart()
  Future<Response> registerAccount({
    // @Header('Authorization') required String authToken,
    @PartMap() required List<PartValue> data,
    @PartFile('profile_pic') required String filePath,
  });


  static ApiService teacher([ChopperClient? client]) => _$ApiService(client);
  @Post(path: Urls.teacherRegistration)
  @Multipart()
  Future<Response> registerTeacher({
    // @Header('Authorization') required String authToken,
    @PartMap() required List<PartValue> data,
    @PartFile('profile_pic') required String filePath,
  });

}
