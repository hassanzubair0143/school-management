import 'dart:convert';

class SchoolNoticeboard {
  bool responce;
  List<Notice> data;

  SchoolNoticeboard({
    required this.responce,
    required this.data,
  });

  factory SchoolNoticeboard.fromRawJson(String str) => SchoolNoticeboard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SchoolNoticeboard.fromJson(Map<String, dynamic> json) => SchoolNoticeboard(
    responce: json["responce"],
    data: List<Notice>.from(json["data"].map((x) => Notice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notice {
  String noticeId;
  String schoolId;
  String noticeDescription;
  NoticeType noticeType;
  String noticeStatus;
  DateTime onDate;

  Notice({
    required this.noticeId,
    required this.schoolId,
    required this.noticeDescription,
    required this.noticeType,
    required this.noticeStatus,
    required this.onDate,
  });

  factory Notice.fromRawJson(String str) => Notice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
    noticeId: json["notice_id"],
    schoolId: json["school_id"],
    noticeDescription: json["notice_description"],
    noticeType: noticeTypeValues.map[json["notice_type"]]!,
    noticeStatus: json["notice_status"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "notice_id": noticeId,
    "school_id": schoolId,
    "notice_description": noticeDescription,
    "notice_type": noticeTypeValues.reverse[noticeType],
    "notice_status": noticeStatus,
    "on_date": onDate.toIso8601String(),
  };
}

enum NoticeType {
  HOLIDAY,
  MEATING,
  OTHER
}

final noticeTypeValues = EnumValues({
  "holiday": NoticeType.HOLIDAY,
  "meating": NoticeType.MEATING,
  "other": NoticeType.OTHER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
