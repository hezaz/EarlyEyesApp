// import 'package:equatable/equatable.dart';
//
// import '../../../data/models/requestModels/student_signup_res_model.dart';
// import '../../../data/models/requestModels/teacher_signup_res_model.dart';
//
// class TeacherRegisterEntities extends Equatable {
//   int? id;
//   int? roleId;
//   dynamic parentId;
//   String? fullName;
//   String? email;
//   dynamic mobileNumber;
//   TeacherDetails? teacherDetails;
//   final String? token;
//
//   TeacherRegisterEntities(
//       {this.token,
//         this.teacherDetails,
//         this.roleId,
//         this.id,
//         this.email,
//         this.fullName,
//         this.mobileNumber,
//         this.parentId});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//     id,
//     roleId,
//     parentId,
//     fullName,
//     email,
//     mobileNumber,
//     teacherDetails,
//     token,
//   ];
//
//   Teacher get model => Teacher(
//       id: id,
//       roleId: roleId,
//       parentId: parentId,
//       fullName: fullName,
//       email: email,
//       mobileNumber: mobileNumber,
//       teacherDetails: teacherDetails,
//       token: token);
// }
