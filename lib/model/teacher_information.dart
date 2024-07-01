import 'dart:convert';

class TeacherInformation {
  bool responce;
  List<TeacherModel> data;

  TeacherInformation({
    required this.responce,
    required this.data,
  });

  factory TeacherInformation.fromRawJson(String str) => TeacherInformation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeacherInformation.fromJson(Map<String, dynamic> json) => TeacherInformation(
    responce: json["responce"],
    data: List<TeacherModel>.from(json["data"].map((x) => TeacherModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TeacherModel {
  String teacherId;
  String schoolId;
  String teacherName;
  String gender;
  String maritalstatus;
  DateTime teacherBirthdate;
  String teacherDetail;
  String teacherImage;
  String teacherPhone;
  String teacherEmail;
  String teacherEducation;
  String teacherAddress;
  String teacherExp;
  String teacherNotes;
  DateTime onDate;

  TeacherModel({
    required this.teacherId,
    required this.schoolId,
    required this.teacherName,
    required this.gender,
    required this.maritalstatus,
    required this.teacherBirthdate,
    required this.teacherDetail,
    required this.teacherImage,
    required this.teacherPhone,
    required this.teacherEmail,
    required this.teacherEducation,
    required this.teacherAddress,
    required this.teacherExp,
    required this.teacherNotes,
    required this.onDate,
  });

  factory TeacherModel.fromRawJson(String str) => TeacherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
    teacherId: json["teacher_id"],
    schoolId: json["school_id"],
    teacherName: json["teacher_name"],
    gender: json["gender"],
    maritalstatus: json["maritalstatus"],
    teacherBirthdate: DateTime.parse(json["teacher_birthdate"]),
    teacherDetail: json["teacher_detail"],
    teacherImage: json["teacher_image"],
    teacherPhone: json["teacher_phone"],
    teacherEmail: json["teacher_email"],
    teacherEducation: json["teacher_education"],
    teacherAddress: json["teacher_address"],
    teacherExp: json["teacher_exp"],
    teacherNotes: json["teacher_notes"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "teacher_id": teacherId,
    "school_id": schoolId,
    "teacher_name": teacherName,
    "gender": gender,
    "maritalstatus": maritalstatus,
    "teacher_birthdate": "${teacherBirthdate.year.toString().padLeft(4, '0')}-${teacherBirthdate.month.toString().padLeft(2, '0')}-${teacherBirthdate.day.toString().padLeft(2, '0')}",
    "teacher_detail": teacherDetail,
    "teacher_image": teacherImage,
    "teacher_phone": teacherPhone,
    "teacher_email": teacherEmail,
    "teacher_education": teacherEducation,
    "teacher_address": teacherAddress,
    "teacher_exp": teacherExp,
    "teacher_notes": teacherNotes,
    "on_date": onDate.toIso8601String(),
  };
}
