import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_register_input.g.dart';

@JsonSerializable()
class ApiRegisterInput {
  final String email;
  final String name;
  final String password;
  final String password_confirmation;
  final String gender;
  final String phone;

  ApiRegisterInput(
      {required this.name,
      required this.password_confirmation,
      required this.gender,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => _$ApiRegisterInputToJson(this);
}
