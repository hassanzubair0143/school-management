import 'dart:convert';

class StudentGrowth {
  bool responce;
  List<dynamic> data;

  StudentGrowth({
    required this.responce,
    required this.data,
  });

  factory StudentGrowth.fromRawJson(String str) => StudentGrowth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentGrowth.fromJson(Map<String, dynamic> json) => StudentGrowth(
    responce: json["responce"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
