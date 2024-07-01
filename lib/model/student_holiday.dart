// To parse this JSON data, do
//
//     final studentHoliday = studentHolidayFromJson(jsonString);

import 'dart:convert';

StudentHoliday studentHolidayFromJson(String str) => StudentHoliday.fromJson(json.decode(str));

String studentHolidayToJson(StudentHoliday data) => json.encode(data.toJson());

class StudentHoliday {
  bool responce;
  List<Growth> data;

  StudentHoliday({
    required this.responce,
    required this.data,
  });

  factory StudentHoliday.fromJson(Map<String, dynamic> json) => StudentHoliday(
    responce: json["responce"],
    data: List<Growth>.from(json["data"].map((x) => Growth.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Growth {
  String holidayId;
  String schoolId;
  String holidayTitle;
  DateTime holidayDate;

  Growth({
    required this.holidayId,
    required this.schoolId,
    required this.holidayTitle,
    required this.holidayDate,
  });

  factory Growth.fromJson(Map<String, dynamic> json) => Growth(
    holidayId: json["holiday_id"],
    schoolId: json["school_id"],
    holidayTitle: json["holiday_title"],
    holidayDate: DateTime.parse(json["holiday_date"]),
  );

  Map<String, dynamic> toJson() => {
    "holiday_id": holidayId,
    "school_id": schoolId,
    "holiday_title": holidayTitle,
    "holiday_date": "${holidayDate.year.toString().padLeft(4, '0')}-${holidayDate.month.toString().padLeft(2, '0')}-${holidayDate.day.toString().padLeft(2, '0')}",
  };
  static Growth empty() =>Growth(
    holidayId:"false",
    schoolId:"",
    holidayTitle:"",
    holidayDate:DateTime.now(),

  );
}
