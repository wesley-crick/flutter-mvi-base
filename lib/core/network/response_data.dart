import 'package:json_annotation/json_annotation.dart';
part 'response_data.g.dart';

@JsonSerializable(
    genericArgumentFactories: true
)
class ResponseData<T>{
  List<T>? results;

  ResponseData({this.results});

  factory ResponseData.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseDataToJson(this, toJsonT);
}