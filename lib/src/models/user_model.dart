import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? password;
  String? cpf;
  @JsonKey(name: 'phone')
  String? celular;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.cpf,
    this.celular,
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(name: $name, cpf: $cpf)';
  }
}
