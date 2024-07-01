import 'dart:convert';

class GetEnquiry {
  bool responce;
  List<dynamic> data;

  GetEnquiry({
    required this.responce,
    required this.data,
  });

  factory GetEnquiry.fromRawJson(String str) => GetEnquiry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetEnquiry.fromJson(Map<String, dynamic> json) => GetEnquiry(
    responce: json["responce"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
