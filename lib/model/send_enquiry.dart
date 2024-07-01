// To parse this JSON data, do
//
//     final sendEnquiry = sendEnquiryFromJson(jsonString);

import 'dart:convert';

SendEnquiry sendEnquiryFromJson(String str) => SendEnquiry.fromJson(json.decode(str));

String sendEnquiryToJson(SendEnquiry data) => json.encode(data.toJson());

class SendEnquiry {
  bool responce;
  List<Student_Enquiry> data;

  SendEnquiry({
    required this.responce,
    required this.data,
  });

  factory SendEnquiry.fromJson(Map<String, dynamic> json) => SendEnquiry(
    responce: json["responce"],
    data: List<Student_Enquiry>.from(json["data"].map((x) => Student_Enquiry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Student_Enquiry {
  String chatId;
  String studentId;
  String schoolId;
  String message;
  String subject;
  String reply;
  DateTime onDate;

  Student_Enquiry({
    required this.chatId,
    required this.studentId,
    required this.schoolId,
    required this.message,
    required this.subject,
    required this.reply,
    required this.onDate,
  });

  factory Student_Enquiry.fromJson(Map<String, dynamic> json) => Student_Enquiry(
    chatId: json["chat_id"],
    studentId: json["student_id"],
    schoolId: json["school_id"],
    message: json["message"],
    subject: json["subject"],
    reply: json["reply"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "chat_id": chatId,
    "student_id": studentId,
    "school_id": schoolId,
    "message": message,
    "subject": subject,
    "reply": reply,
    "on_date": onDate.toIso8601String(),
  };
}
