// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..errno = json['errno'] as num
    ..result = json['result'] as Map<String, dynamic>;
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'errno': instance.errno, 'result': instance.result};
