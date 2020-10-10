import 'package:meta/meta.dart';
import 'dart:convert';

class PokeResponse {
    PokeResponse({
        @required this.count,
        @required this.next,
        @required this.previous,
        @required this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<Result> results;

    PokeResponse copyWith({
        int count,
        String next,
        dynamic previous,
        List<Result> results,
    }) => 
        PokeResponse(
            count: count ?? this.count,
            next: next ?? this.next,
            previous: previous ?? this.previous,
            results: results ?? this.results,
        );

    factory PokeResponse.fromRawJson(String str) => PokeResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PokeResponse.fromJson(Map<String, dynamic> json) => PokeResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}