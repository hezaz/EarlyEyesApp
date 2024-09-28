import 'package:chopper/chopper.dart';
import 'package:early_eyes/services/networking/urls.dart';

import '../../feature/data/dataSource/remoteDataSource/apiService.dart';

class ApiInstance {
  ApiInstance._internal(this.chopper);

  final ChopperClient chopper;

  factory ApiInstance.build() {
    final client = ApiInstance._internal(ChopperClient(
      baseUrl: Uri.parse(Urls.apiBaseUrl),
      converter: const JsonConverter(),
      services: [ApiService.create()],
      interceptors: [
        CurlInterceptor(),
        HttpLoggingInterceptor(),
      ],
    ));
    return client;
  }

  ChopperClient get client => chopper;

  ApiService get getServices => chopper.getService<ApiService>();
}
