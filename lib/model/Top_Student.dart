import 'dart:convert';
import 'package:http/http.dart';

class TopStudent {
  bool responce;
  List<dynamic> data;

  TopStudent({
    required this.responce,
    required this.data,
  });

  factory TopStudent.fromRawJson(String str) => TopStudent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopStudent.fromJson(Map<String, dynamic> json) => TopStudent(
    responce: json["responce"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
