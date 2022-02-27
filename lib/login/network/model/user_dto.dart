import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto{
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserDto({this.id, this.name, this.email,this.gender, this.status});

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable(
  genericArgumentFactories: true
)
class ResponseData<T>{
  int? code;
  dynamic meta;
  List<T>? data;

  ResponseData({this.code, this.meta, this.data});

  factory ResponseData.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
  ) => _$ResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseDataToJson(this, toJsonT);
}