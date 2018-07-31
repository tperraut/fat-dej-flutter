import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "admin")
  final bool admin;

  User(this.username, this.email, this.admin);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}