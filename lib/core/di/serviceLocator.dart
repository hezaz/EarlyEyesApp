//
//
//
// import 'package:early_eyes/feature/controller/auth_controller.dart';
// import 'package:early_eyes/feature/domain/useCase/teacherRegisterUseCase.dart';
// import 'package:get_it/get_it.dart';
//
// import '../../feature/data/dataSource/remoteDataSource/apiService.dart';
// import '../../feature/data/repository/iAuthRepository.dart';
// import '../../feature/domain/repository/auth_repository.dart';
// import '../../feature/domain/useCase/studentRegisterUseCase.dart';
// import '../../services/networking/instance.dart';
//
// final sl = GetIt.I;
//
// void setupLocator() async{
//   // await HiveInstance.createInstance();
//   // Box<PostRequestEntity> postBox = await HiveInstance.postBoxInstance();
//
//
//  // sl.registerFactory<AuthController>(() => AuthController(sl(),sl()));
//
//   //client
//   final instance = sl.registerSingleton<ApiInstance>(ApiInstance.build());
//   sl.registerLazySingleton<ApiService>(()=>ApiService.create(instance.client));
//
//   // sl.registerLazySingleton<AuthRepository>(() => IAuthRepository());
//
//   //repository
//   sl.registerLazySingleton<AuthRepository>(() => IAuthRepository(),);
//   sl.registerLazySingleton(() => StudentRegisterUseCase(sl()));
//   sl.registerLazySingleton(() => TeacherRegisterUseCase(sl()));
//
//
//
//
//
//
//
//
//
//
// }