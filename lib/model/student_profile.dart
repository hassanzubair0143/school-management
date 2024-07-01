import 'dart:convert';

class StudentProfile {
  bool responce;
  Porofile_Model  data;
  String query;

  StudentProfile({
    required this.responce,
    required this.data,
    required this.query,
  });

  factory StudentProfile.fromRawJson(String str) => StudentProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentProfile.fromJson(Map<String, dynamic> json) => StudentProfile(
    responce: json["responce"],
    data: Porofile_Model .fromJson(json["data"]),
    query: json["query"],
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": data.toJson(),
    "query": query,
  };
}

class Porofile_Model {
  String studentId;
  String schoolId;
  String studentUserName;
  String studentStatus;
  String studentPassword;
  String studentOrgpassword;
  String studentUniqueNo;
  String studentName;
  DateTime studentBirthdate;
  String studentRollNo;
  String studentStandard;
  String studentAddress;
  String studentCity;
  String studentPhone;
  String studentParentPhone;
  String studentEnrNo;
  String studentEmail;
  String studentPhoto;
  String studentBranch;
  String studentSemester;
  String studentDivision;
  String studentBatch;
  String gcmCode;
  String schoolName;
  String schoolAddress;
  String standardTitle;

  Porofile_Model({
    required this.studentId,
    required this.schoolId,
    required this.studentUserName,
    required this.studentStatus,
    required this.studentPassword,
    required this.studentOrgpassword,
    required this.studentUniqueNo,
    required this.studentName,
    required this.studentBirthdate,
    required this.studentRollNo,
    required this.studentStandard,
    required this.studentAddress,
    required this.studentCity,
    required this.studentPhone,
    required this.studentParentPhone,
    required this.studentEnrNo,
    required this.studentEmail,
    required this.studentPhoto,
    required this.studentBranch,
    required this.studentSemester,
    required this.studentDivision,
    required this.studentBatch,
    required this.gcmCode,
    required this.schoolName,
    required this.schoolAddress,
    required this.standardTitle,
  });

  factory Porofile_Model .fromRawJson(String str) => Porofile_Model .fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Porofile_Model .fromJson(Map<String, dynamic> json) => Porofile_Model (
    studentId: json["student_id"],
    schoolId: json["school_id"],
    studentUserName: json["student_user_name"],
    studentStatus: json["student_status"],
    studentPassword: json["student_password"],
    studentOrgpassword: json["student_orgpassword"],
    studentUniqueNo: json["student_unique_no"],
    studentName: json["student_name"],
    studentBirthdate: DateTime.parse(json["student_birthdate"]),
    studentRollNo: json["student_roll_no"],
    studentStandard: json["student_standard"],
    studentAddress: json["student_address"],
    studentCity: json["student_city"],
    studentPhone: json["student_phone"],
    studentParentPhone: json["student_parent_phone"],
    studentEnrNo: json["student_enr_no"],
    studentEmail: json["student_email"],
    studentPhoto: json["student_photo"],
    studentBranch: json["student_branch"],
    studentSemester: json["student_semester"],
    studentDivision: json["student_division"],
    studentBatch: json["student_batch"],
    gcmCode: json["gcm_code"],
    schoolName: json["school_name"],
    schoolAddress: json["school_address"],
    standardTitle: json["standard_title"],
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "school_id": schoolId,
    "student_user_name": studentUserName,
    "student_status": studentStatus,
    "student_password": studentPassword,
    "student_orgpassword": studentOrgpassword,
    "student_unique_no": studentUniqueNo,
    "student_name": studentName,
    "student_birthdate": "${studentBirthdate.year.toString().padLeft(4, '0')}-${studentBirthdate.month.toString().padLeft(2, '0')}-${studentBirthdate.day.toString().padLeft(2, '0')}",
    "student_roll_no": studentRollNo,
    "student_standard": studentStandard,
    "student_address": studentAddress,
    "student_city": studentCity,
    "student_phone": studentPhone,
    "student_parent_phone": studentParentPhone,
    "student_enr_no": studentEnrNo,
    "student_email": studentEmail,
    "student_photo": studentPhoto,
    "student_branch": studentBranch,
    "student_semester": studentSemester,
    "student_division": studentDivision,
    "student_batch": studentBatch,
    "gcm_code": gcmCode,
    "school_name": schoolName,
    "school_address": schoolAddress,
    "standard_title": standardTitle,
  };
}
