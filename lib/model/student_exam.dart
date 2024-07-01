import 'dart:convert';

class StudentExam {
  String query;
  bool responce;
  List<Exam> data;

  StudentExam({
    required this.query,
    required this.responce,
    required this.data,
  });

  factory StudentExam.fromRawJson(String str) => StudentExam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentExam.fromJson(Map<String, dynamic> json) => StudentExam(
    query: json["query"],
    responce: json["responce"],
    data: List<Exam>.from(json["data"].map((x) => Exam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "query": query,
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Exam {
  String examId;
  String schoolId;
  String examTitle;
  String examNote;
  String examStatus;
  String examStandard;
  DateTime examDate;
  DateTime onDate;


  Exam({
    required this.examId,
    required this.schoolId,
    required this.examTitle,
    required this.examNote,
    required this.examStatus,
    required this.examStandard,
    required this.examDate,
    required this.onDate,
  });

  factory Exam.fromRawJson(String str) => Exam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
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
