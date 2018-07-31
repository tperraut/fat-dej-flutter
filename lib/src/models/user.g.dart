// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['username'] as String, json['email'] as String,
      json['admin'] as bool);
}

abstract class _$UserSerializerMixin {
  String get username;
  String get email;
  bool get admin;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'username': username, 'email': email, 'admin': admin};
}
