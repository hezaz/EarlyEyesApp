// import 'package:early_eyes/core/useCase.dart';
// import 'package:early_eyes/feature/data/models/requestModels/student_signup_res_model.dart';
// import 'package:early_eyes/feature/domain/repository/auth_repository.dart';
// import '../../data/models/requestModels/StudentRequestEntity.dart';
// import '../../data/models/requestModels/teacher_request_entity.dart';
// import '../../data/models/requestModels/teacher_signup_res_model.dart';
//
// class TeacherRegisterUseCase extends UseCase<Teacher,TeacherRequestEntity>{
//   final AuthRepository _repo;
//   TeacherRegisterUseCase(this._repo);
//
//   @override
//   Future<Teacher> call(TeacherRequestEntity params) async{
//     final result = await _repo.registerTeacher(data: params);
//     if(result.isSuccess){
//       return result.data!;
//     }else{
//       throw result.getError;
//     }
//   }
// }