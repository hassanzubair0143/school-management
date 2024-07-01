import 'dart:convert';

class StudentResult {
  bool responce;
  List<Result> data;

  StudentResult({
    required this.responce,
    required this.data,
  });

  factory StudentResult.fromRawJson(String str) => StudentResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentResult.fromJson(Map<String, dynamic> json) => StudentResult(
    responce: json["responce"],
    data: List<Result>.from(json["data"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Result {
  String examId;
  String schoolId;
  String examTitle;
  String examNote;
  String examStatus;
  String examStandard;
  DateTime examDate;
  DateTime onDate;

  Result({
    required this.examId,
    required this.schoolId,
    required this.examTitle,
    required this.examNote,
    required this.examStatus,
    required this.examStandard,
    required this.examDate,
    required this.onDate,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    examId: json["exam_id"],
    schoolId: json["school_id"],
    examTitle: json["exam_title"],
    examNote: json["exam_note"],
    examStatus: json["exam_status"],
    examStandard: json["exam_standard"],
    examDate: DateTime.parse(json["exam_date"]),
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "exam_id": examId,
    "school_id": schoolId,
    "exam_title": examTitle,
    "exam_note": examNote,
    "exam_status": examStatus,
    "exam_standard": examStandard,
    "exam_date": "${examDate.year.toString().padLeft(4, '0')}-${examDate.month.toString().padLeft(2, '0')}-${examDate.day.toString().padLeft(2, '0')}",
    "on_date": onDate.toIso8601String(),
  };
}
