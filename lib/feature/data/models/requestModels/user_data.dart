// class UserData {
//   final int? id;
//   final int? roleId;
//   final dynamic parentId;
//   final String? fullName;
//   final String? email;
//   final String? mobileNumber;
//   final int? isActive;
//   final String? token;
//   final DateTime? lastLoggedIn;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final UserDetails? userDetails;
//
//   UserData({
//     this.id,
//     this.roleId,
//     this.parentId,
//     this.fullName,
//     this.email,
//     this.mobileNumber,
//     this.isActive,
//     this.token,
//     this.lastLoggedIn,
//     this.createdAt,
//     this.updatedAt,
//     this.userDetails,
//   });
//
//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//     id: json["id"],
//     roleId: json["role_id"],
//     parentId: json["parent_id"],
//     fullName: json["full_name"],
//     email: json["email"],
//     mobileNumber: json["mobile_number"],
//     isActive: json["is_active"],
//     token: json["token"],
//     lastLoggedIn: json["last_logged_in"] == null ? null : DateTime.parse(json["last_logged_in"]),
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "role_id": roleId,
//     "parent_id": parentId,
//     "full_name": fullName,
//     "email": email,
//     "mobile_number": mobileNumber,
//     "is_active": isActive,
//     "token": token,
//     "last_logged_in": lastLoggedIn?.toIso8601String(),
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "user_details": userDetails?.toJson(),
//   };
// }
//
// class UserDetails {
//   final int? id;
//   final int? userId;
//   final dynamic gender;
//   final DateTime? dob;
//   final dynamic userDetailsClass;
//   final dynamic studentEmail;
//   final dynamic mailingAddress;
//   final dynamic experience;
//   final dynamic comment;
//   final dynamic profilePic;
//   final dynamic tutorEmail;
//   final dynamic schoolName;
//   final dynamic courseId;
//   final dynamic courseName;
//   final dynamic courseSchedule;
//   final String? relationship;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//
//   UserDetails({
//     this.id,
//     this.userId,
//     this.gender,
//     this.dob,
//     this.userDetailsClass,
//     this.studentEmail,
//     this.mailingAddress,
//     this.experience,
//     this.comment,
//     this.profilePic,
//     this.tutorEmail,
//     this.schoolName,
//     this.courseId,
//     this.courseName,
//     this.courseSchedule,
//     this.relationship,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
//     id: json["id"],
//     userId: json["user_id"],
//     gender: json["gender"],
//     dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//     userDetailsClass: json["class"],
//     studentEmail: json["student_email"],
//     mailingAddress: json["mailing_address"],
//     experience: json["experience"],
//     comment: json["comment"],
//     profilePic: json["profile_pic"],
//     tutorEmail: json["tutor_email"],
//     schoolName: json["school_name"],
//     courseId: json["course_id"],
//     courseName: json["course_name"],
//     courseSchedule: json["course_schedule"],
//     relationship: json["relationship"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_id": userId,
//     "gender": gender,
//     "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
//     "class": userDetailsClass,
//     "student_email": studentEmail,
//     "mailing_address": mailingAddress,
//     "experience": experience,
//     "comment": comment,
//     "profile_pic": profilePic,
//     "tutor_email": tutorEmail,
//     "school_name": schoolName,
//     "course_id": courseId,
//     "course_name": courseName,
//     "course_schedule": courseSchedule,
//     "relationship": relationship,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }