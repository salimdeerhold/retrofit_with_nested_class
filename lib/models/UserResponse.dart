import 'package:json_annotation/json_annotation.dart';
import 'User.dart';
part 'UserResponse.g.dart';

@JsonSerializable()
class UserResponse{
  @JsonKey(name:"data")
  late User user;

  UserResponse();

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}