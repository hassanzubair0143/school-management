import 'dart:convert';

class ResultReport {
  bool responce;
  List<Result_Report> data;

  ResultReport({
    required this.responce,
    required this.data,
  });

  factory ResultReport.fromRawJson(String str) => ResultReport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultReport.fromJson(Map<String, dynamic> json) => ResultReport(
    responce: json["responce"],
    data: List<Result_Report>.from(json["data"].map((x) => Result_Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Result_Report {
  String examResultId;
  String examId;
  String studentId;
  String subject;
  String markObtain;
  String totalMark;
  DateTime onDate;

  Result_Report({
    required this.examResultId,
    required this.examId,
    required this.studentId,
    required this.subject,
    required this.markObtain,
    required this.totalMark,
    required this.onDate,
  });

  factory Result_Report.fromRawJson(String str) => Result_Report.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result_Report.fromJson(Map<String, dynamic> json) => Result_Report(
    examResultId: json["exam_result_id"],
    examId: json["exam_id"],
    studentId: json["student_id"],
    subject: json["subject"],
    markObtain: json["mark_obtain"],
    totalMark: json["total_mark"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "exam_result_id": examResultId,
    "exam_id": examId,
    "student_id": studentId,
    "subject": subject,
    "mark_obtain": markObtain,
    "total_mark": totalMark,
    "on_date": onDate.toIso8601String(),
  };
}
