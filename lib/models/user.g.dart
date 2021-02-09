// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..user = json['user'] as String
    ..token = json['token'] as String
    ..access = json['access'] as num;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'access': instance.access
    };
