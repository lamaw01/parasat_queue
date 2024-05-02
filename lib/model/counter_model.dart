// To parse this JSON data, do
//
//     final counterModel = counterModelFromJson(jsonString);

import 'dart:convert';

CounterModel counterModelFromJson(String str) =>
    CounterModel.fromJson(json.decode(str));

String counterModelToJson(CounterModel data) => json.encode(data.toJson());

class CounterModel {
  int regular;
  int special;

  CounterModel({
    required this.regular,
    required this.special,
  });

  factory CounterModel.fromJson(Map<String, dynamic> json) => CounterModel(
        regular: json["regular"],
        special: json["special"],
      );

  Map<String, dynamic> toJson() => {
        "regular": regular,
        "special": special,
      };
}
