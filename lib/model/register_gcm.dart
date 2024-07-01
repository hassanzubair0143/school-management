import 'dart:convert';

class GcmRegister {
  bool responce;

  GcmRegister({
    required this.responce,
  });

  factory GcmRegister.fromRawJson(String str) => GcmRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GcmRegister.fromJson(Map<String, dynamic> json) => GcmRegister(
    responce: json["responce"],
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
  };
}
