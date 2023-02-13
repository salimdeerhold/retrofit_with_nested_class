import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name:"id")
  late int id;

  @JsonKey(name:"email")
  late String email;

  @JsonKey(name:"first_name")
  late String first_name;

  @JsonKey(name:"last_name")
  late String last_name;

  @JsonKey(name:"avatar")
  late String avatar;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}