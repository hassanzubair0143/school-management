import 'dart:convert';

class StudentEvent {
  bool responce;
  List<News> data;

  StudentEvent({
    required this.responce,
    required this.data,
  });

  factory StudentEvent.fromRawJson(String str) => StudentEvent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentEvent.fromJson(Map<String, dynamic> json) => StudentEvent(
    responce: json["responce"],
    data: List<News>.from(json["data"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class News {
  String eventId;
  String schoolId;
  String eventTitle;
  String eventDescription;
  EventImage eventImage;
  DateTime eventStart;
  DateTime eventEnd;
  String eventStatus;
  DateTime onDate;

  News({
    required this.eventId,
    required this.schoolId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventStart,
    required this.eventEnd,
    required this.eventStatus,
    required this.onDate,
  });

  factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory News.fromJson(Map<String, dynamic> json) => News(
    eventId: json["event_id"],
    schoolId: json["school_id"],
    eventTitle: json["event_title"],
    eventDescription: json["event_description"],
    eventImage: eventImageValues.map[json["event_image"]]!,
    eventStart: DateTime.parse(json["event_start"]),
    eventEnd: DateTime.parse(json["event_end"]),
    eventStatus: json["event_status"],
    onDate: DateTime.parse(json["on_date"]),
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "school_id": schoolId,
    "event_title": eventTitle,
    "event_description": eventDescription,
    "event_image": eventImageValues.reverse[eventImage],
    "event_start": "${eventStart.year.toString().padLeft(4, '0')}-${eventStart.month.toString().padLeft(2, '0')}-${eventStart.day.toString().padLeft(2, '0')}",
    "event_end": "${eventEnd.year.toString().padLeft(4, '0')}-${eventEnd.month.toString().padLeft(2, '0')}-${eventEnd.day.toString().padLeft(2, '0')}",
    "event_status": eventStatus,
    "on_date": onDate.toIso8601String(),
  };
}

enum EventImage {
  EMPTY,
  FREE_PNG_HD_OF_CARS_CAR_FREE_DOWNLOAD_PNG_20481_PNG,
  ICONS8_ELECTRICIAN_1002_PNG
}

final eventImageValues = EnumValues({
  "": EventImage.EMPTY,
  "free-png-hd-of-cars-car-free-download-png-20481.png": EventImage.FREE_PNG_HD_OF_CARS_CAR_FREE_DOWNLOAD_PNG_20481_PNG,
  "icons8-electrician-1002.png": EventImage.ICONS8_ELECTRICIAN_1002_PNG
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
