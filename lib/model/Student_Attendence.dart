// // import 'dart:convert';
// //
// // StudentAttandance studentAttandanceFromJson(String str) => StudentAttandance.fromJson(json.decode(str));
// //
// // String studentAttandanceToJson(StudentAttandance data) => json.encode(data.toJson());
// //
// // class StudentAttandance {
// //   bool responce;
// //   List<AttandanceModel> data;
// //
// //   StudentAttandance({
// //     required this.responce,
// //     required this.data,
// //   });
// //
// //   factory StudentAttandance.fromJson(Map<String, dynamic> json) => StudentAttandance(
// //     responce: json["responce"],
// //     data: List<AttandanceModel>.from(json["data"].map((x) => AttandanceModel.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "responce": responce,
// //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
// //   };
// // }
// //
// // class AttandanceModel {
// //   String attendenceId;
// //   String schoolId;
// //   String standardId;
// //   String studentId;
// //   DateTime attendenceDate;
// //   String attended;
// //   String attendenceReason;
// //   DateTime onDate;
// //
// //   AttandanceModel({
// //     required this.attendenceId,
// //     required this.schoolId,
// //     required this.standardId,
// //     required this.studentId,
// //     required this.attendenceDate,
// //     required this.attended,
// //     required this.attendenceReason,
// //     required this.onDate,
// //   });
// //
// //   factory AttandanceModel.fromJson(Map<String, dynamic> json) => AttandanceModel(
// //     attendenceId: json["attendence_id"],
// //     schoolId: json["school_id"],
// //     standardId: json["standard_id"],
// //     studentId: json["student_id"],
// //     attendenceDate: DateTime.parse(json["attendence_date"]),
// //     attended: json["attended"],
// //     attendenceReason: json["attendence_reason"],
// //     onDate: DateTime.parse(json["on_date"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "attendence_id": attendenceId,
// //     "school_id": schoolId,
// //     "standard_id": standardId,
// //     "student_id": studentId,
// //     "attendence_date": "${attendenceDate.year.toString().padLeft(4, '0')}-${attendenceDate.month.toString().padLeft(2, '0')}-${attendenceDate.day.toString().padLeft(2, '0')}",
// //     "attended": attended,
// //     "attendence_reason": attendenceReason,
// //     "on_date": onDate.toIso8601String(),
// //   };
// // }
// // import 'dart:convert';
// // import 'package:http/http.dart'; // Ensure you import the http package for the post method
// //
// // // Function to convert JSON string to StudentAttandance object
// // StudentAttandance studentAttandanceFromJson(String str) => StudentAttandance.fromJson(json.decode(str));
// //
// // // Function to convert StudentAttandance object to JSON string
// // String studentAttandanceToJson(StudentAttandance data) => json.encode(data.toJson());
// //
// // class StudentAttandance {
// //   bool responce;
// //   List<AttandanceModel> data;
// //
// //   StudentAttandance({
// //     required this.responce,
// //     required this.data,
// //   });
// //
// //   factory StudentAttandance.fromJson(Map<String, dynamic> json) => StudentAttandance(
// //     responce: json["responce"].toString().toLowerCase() == 'true',
// //     data: List<AttandanceModel>.from(json["data"].map((x) => AttandanceModel.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "responce": responce,
// //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
// //   };
// // }
// //
// // class AttandanceModel {
// //   String attendenceId;
// //   String schoolId;
// //   String standardId;
// //   String studentId;
// //   DateTime attendenceDate;
// //   bool attended;
// //   String attendenceReason;
// //   DateTime onDate;
// //
// //   AttandanceModel({
// //     required this.attendenceId,
// //     required this.schoolId,
// //     required this.standardId,
// //     required this.studentId,
// //     required this.attendenceDate,
// //     required this.attended,
// //     required this.attendenceReason,
// //     required this.onDate,
// //   });
// //
// //   factory AttandanceModel.fromJson(Map<String, dynamic> json) => AttandanceModel(
// //     attendenceId: json["attendence_id"],
// //     schoolId: json["school_id"],
// //     standardId: json["standard_id"],
// //     studentId: json["student_id"],
// //     attendenceDate: DateTime.parse(json["attendence_date"]),
// //     attended: json["attended"],
// //     attendenceReason: json["attendence_reason"],
// //     onDate: DateTime.parse(json["on_date"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "attendence_id": attendenceId,
// //     "school_id": schoolId,
// //     "standard_id": standardId,
// //     "student_id": studentId,
// //     "attendence_date": attendenceDate.toIso8601String(),
// //     "attended": attended,
// //     "attendence_reason": attendenceReason,
// //     "on_date": onDate.toIso8601String(),
// //   };
// //
// //   // Factory constructor to create an empty AttandanceModel
// //   factory AttandanceModel.empty() {
// //     return AttandanceModel(
// //       attendenceId: '',
// //       schoolId: '',
// //       standardId: '',
// //       studentId: '',
// //       attendenceDate: DateTime.now(),
// //       attended: false,
// //       attendenceReason: '',
// //       onDate: DateTime.now(),
// //     );
// //   }
// // }
//
// class AttandanceModel {
//   String attendenceId;
//   String schoolId;
//   String standardId;
//   String studentId;
//   DateTime attendenceDate;
//   String attended; // Changed from bool to String to match the original code
//   String attendenceReason;
//   DateTime onDate;
//
//   AttandanceModel({
//     required this.attendenceId,
//     required this.schoolId,
//     required this.standardId,
//     required this.studentId,
//     required this.attendenceDate,
//     required this.attended,
//     required this.attendenceReason,
//     required this.onDate,
//   });
//
//   factory AttandanceModel.fromJson(Map<String, dynamic> json) => AttandanceModel(
//     attendenceId: json["attendence_id"],
//     schoolId: json["school_id"],
//     standardId: json["standard_id"],
//     studentId: json["student_id"],
//     attendenceDate: DateTime.parse(json["attendence_date"]),
//     attended: json["attended"],
//     attendenceReason: json["attendence_reason"],
//     onDate: DateTime.parse(json["on_date"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "attendence_id": attendenceId,
//     "school_id": schoolId,
//     "standard_id": standardId,
//     "student_id": studentId,
//     "attendence_date": "${attendenceDate.year.toString().padLeft(4, '0')}-${attendenceDate.month.toString().padLeft(2, '0')}-${attendenceDate.day.toString().padLeft(2, '0')}",
//     "attended": attended,
//     "attendence_reason": attendenceReason,
//     "on_date": onDate.toIso8601String(),
//   };
//
//   // Static empty method
//   static AttandanceModel empty() {
//     return AttandanceModel(
//       attendenceId: '',
//       schoolId: '',
//       standardId: '',
//       studentId: '',
//       attendenceDate: DateTime(2000, 1, 1),
//       attended: 'false',
//       attendenceReason: '',
//       onDate: DateTime(2000, 1, 1),
//     );
//   }
// }
//
import 'dart:convert';

StudentAttandance studentAttandanceFromJson(String str) => StudentAttandance.fromJson(json.decode(str));

String studentAttandanceToJson(StudentAttandance data) => json.encode(data.toJson());

class StudentAttandance {
  bool responce;
  List<AttandanceModel> data;

  StudentAttandance({
    required this.responce,
    required this.data,
  });

  factory StudentAttandance.fromJson(Map<String, dynamic> json) => StudentAttandance(
    responce: json["responce"],
    data: List<AttandanceModel>.from(json["data"].map((x) => AttandanceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AttandanceModel {
  String attendenceId;
  String schoolId;
  String standardId;
  String studentId;
  DateTime attendenceDate;
  String attended;
  String attendenceReason;
  DateTime onDate;

  AttandanceModel({
    required this.attendenceId,
    required this.schoolId,
    required this.standardId,
    required this.studentId,
    required this.attendenceDate,
    required this.attended,
    required this.attendenceReason,
    required this.onDate,
  });

  factory AttandanceModel.fromJson(Map<String, dynamic> json) => AttandanceModel(
    attendenceId: json["attendence_id"],
    schoolId: json["school_id"],
    standardId: json["standard_id"],
    studentId: json["student_id"],
    attendenceDate: DateTime.parse(json["attendence_date"]),
    attended: json["attended"],
    attendenceReason: json["attendence_reason"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "attendence_id": attendenceId,
    "school_id": schoolId,
    "standard_id": standardId,
    "student_id": studentId,
    "attendence_date": attendenceDate.toIso8601String(),
    "attended": attended,
    "attendence_reason": attendenceReason,
    "on_date": onDate.toIso8601String(),
  };

  static AttandanceModel empty() => AttandanceModel(
    attendenceId: '',
    schoolId: '',
    standardId: '',
    studentId: '',
    attendenceDate: DateTime.now(),
    attended: '',
    attendenceReason: '',
    onDate: DateTime.now(),
  );
}
