// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      cpf: json['cpf'] as String,
      celular: json['phone'] as String,
      id: json['id'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.name,
      'email': instance.email,
      'password': instance.password,
      'cpf': instance.cpf,
      'phone': instance.celular,
      'id': instance.id,
      'token': instance.token,
    };
