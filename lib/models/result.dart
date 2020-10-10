import 'package:meta/meta.dart';
import 'dart:convert';

class Result {
  Result({
    @required this.name,
    @required this.url,
  });

  String name;
  String url;

  Result copyWith({
    String name,
    String url,
  }) =>
      Result(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
