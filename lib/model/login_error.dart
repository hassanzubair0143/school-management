import 'dart:convert';

class LoginError {
  bool responce;
  String error;

  LoginError({
    required this.responce,
    required this.error,
  });

  factory LoginError.fromRawJson(String str) => LoginError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginError.fromJson(Map<String, dynamic> json) => LoginError(
    responce: json["responce"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "responce": responce,
    "error": error,
  };
}
