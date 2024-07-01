import 'dart:convert';

class Login {
  StudentModel data;
  bool responce;

  Login({
    required this.data,
    required this.responce,
  });

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    data: StudentModel.fromJson(json["data"]),
    responce: json["responce"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "responce": responce,
  };
}

class StudentModel {
  String studentId = '';
  String schoolId = '';
  String studentUserName = '';
  String studentStatus = '';
  String studentUniqueNo = '';
  String studentName = '';
  DateTime studentBirthdate=DateTime.now();
  String studentRollNo = '';
  String studentStandard = '';
  String studentAddress = '';
  String studentCity = '';
  String studentPhone = '';
  String studentParentPhone = '';
  String studentEmail = '';
  String studentPhoto = '';
  String studentBranch = '';
  String studentSemester = '';
  String studentDivision = '';
  String studentBatch = '';

  StudentModel({
    required this.studentId,
    required this.schoolId,
    required this.studentUserName,
    required this.studentStatus,
    required this.studentUniqueNo,
    required this.studentName,
    required this.studentBirthdate,
    required this.studentRollNo,
    required this.studentStandard,
    required this.studentAddress,
    required this.studentCity,
    required this.studentPhone,
    required this.studentParentPhone,
    required this.studentEmail,
    required this.studentPhoto,
    required this.studentBranch,
    required this.studentSemester,
    required this.studentDivision,
    required this.studentBatch,
  });

  factory StudentModel.fromRawJson(String str) => StudentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    studentId: json["student_id"] ?? '',
    schoolId: json["school_id"] ?? '',
    studentUserName: json["student_user_name"] ?? '',
    studentStatus: json["student_status"] ?? '',
    studentUniqueNo: json["student_unique_no"] ?? '',
    studentName: json["student_name"] ?? '',
    studentBirthdate: DateTime.parse(json["student_birthdate"])??DateTime.now(),
    studentRollNo: json["student_roll_no"] ?? '',
    studentStandard: json["student_standard"] ?? '',
    studentAddress: json["student_address"] ?? '',
    studentCity: json["student_city"] ?? '',
    studentPhone: json["student_phone"] ?? '',
    studentParentPhone: json["student_parent_phone"] ?? '',
    studentEmail: json["student_email"] ?? '',
    studentPhoto: json["student_photo"] ?? '',
    studentBranch: json["student_branch"] ?? '',
    studentSemester: json["student_semester"] ?? '',
    studentDivision: json["student_division"] ?? '',
    studentBatch: json["student_batch"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "school_id": schoolId,
    "student_user_name": studentUserName,
    "student_status": studentStatus,
    "student_unique_no": studentUniqueNo,
    "student_name": studentName,
    "student_birthdate": "${studentBirthdate.year.toString().padLeft(4, '0')}-${studentBirthdate.month.toString().padLeft(2, '0')}-${studentBirthdate.day.toString().padLeft(2, '0')}",
    "student_roll_no": studentRollNo,
    "student_standard": studentStandard,
    "student_address": studentAddress,
    "student_city": studentCity,
    "student_phone": studentPhone,
    "student_parent_phone": studentParentPhone,
    "student_email": studentEmail,
    "student_photo": studentPhoto,
    "student_branch": studentBranch,
    "student_semester": studentSemester,
    "student_division": studentDivision,
    "student_batch": studentBatch,
  };
}
