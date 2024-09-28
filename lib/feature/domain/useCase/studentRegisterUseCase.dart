// import 'package:early_eyes/core/useCase.dart';
// import 'package:early_eyes/feature/data/models/requestModels/student_signup_res_model.dart';
// import 'package:early_eyes/feature/domain/repository/auth_repository.dart';
// import '../../data/models/requestModels/StudentRequestEntity.dart';
//
// class StudentRegisterUseCase extends UseCase<User,StudentRequestEntity>{
//   final AuthRepository _repo;
//   StudentRegisterUseCase(this._repo);
//
//   @override
//   Future<User> call(StudentRequestEntity params) async{
//     final result = await _repo.registerStudent(data: params);
//     if(result.isSuccess){
//       return result.data!;
//     }else{
//       throw result.getError;
//     }
//   }
// }