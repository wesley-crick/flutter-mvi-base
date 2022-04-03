import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  NameDto? name;

  UserDto({this.name});

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class NameDto {
  String? first;
  String? last;

  NameDto({this.first, this.last});

  factory NameDto.fromJson(Map<String, dynamic> json) => _$NameDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NameDtoToJson(this);
}